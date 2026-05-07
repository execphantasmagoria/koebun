import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:sherpa_onnx/sherpa_onnx.dart';
import 'package:flutter/foundation.dart';

class STTService {
  final AudioRecorder _recorder = AudioRecorder();
  OnlineRecognizer? _recognizer;
  OnlineStream? _stream;
  OnlineStream? _testStream;
  StreamSubscription<Uint8List>? _micSubscription;
  Timer? _pollTimer;

  final StreamController<String> _partialTextController = StreamController<String>.broadcast();

  Stream<String> get partialText => _partialTextController.stream;

  bool _isInitialized = false;
  bool _isListening = false;
  bool _bindingsInitialized = false;

  bool get isInitialized => _isInitialized;
  bool get isListening => _isListening;

  Future<String> _copyAssetToFile(String assetPath, String fileName) async {
    debugPrint('Copying $assetPath to $fileName...');
    final directory = await getApplicationDocumentsDirectory();
    debugPrint('Directory: ${directory.path}');
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);
    if(!await file.exists())
    {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
    }
    return filePath;
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    initSherpa();

    final encoder = await _copyAssetToFile('assets/models/sherpa-onnx-streaming-zipformer-en-20M-2023-02-17/encoder-epoch-99-avg-1.int8.onnx', 'encoder-epoch-99-avg-1.int8.onnx');
    final decoder = await _copyAssetToFile('assets/models/sherpa-onnx-streaming-zipformer-en-20M-2023-02-17/decoder-epoch-99-avg-1.int8.onnx', 'decoder-epoch-99-avg-1.int8.onnx');
    final joiner = await _copyAssetToFile('assets/models/sherpa-onnx-streaming-zipformer-en-20M-2023-02-17/joiner-epoch-99-avg-1.int8.onnx', 'joiner-epoch-99-avg-1.int8.onnx');
    final tokens = await _copyAssetToFile('assets/models/sherpa-onnx-streaming-zipformer-en-20M-2023-02-17/tokens.txt', 'tokens.txt');
    // final config = await _copyAssetToFile('assets/models/config.json', 'config.json');

    debugPrint('Copying done');
    final modelConfig = OnlineModelConfig(
      transducer: OnlineTransducerModelConfig(
        encoder: encoder,
        decoder: decoder,
        joiner: joiner,
      ),
      tokens: tokens,
      provider: 'cpu',
      debug: true,
      modelType: 'zipformer-transducer',
    );
    debugPrint('Model config done');

    final featConfig = FeatureConfig(
      sampleRate: 16000,
      featureDim: 80,
    );
    debugPrint('Feature config done');

    final recognizerConfig = OnlineRecognizerConfig(
      model: modelConfig,
      feat: featConfig,
    );
    debugPrint('Recognizer config done');

    _recognizer = OnlineRecognizer(recognizerConfig);
    debugPrint('Recognizer created');
    _isInitialized = true;
  }

  Future<void> startListening() async {
    debugPrint('Starting listening...');
    if (!_isInitialized || _isListening || _recognizer == null) return;

    if(!await _recorder.hasPermission()) throw Exception('Microphone permission not granted.');

    debugPrint('Starting recording...');
    _stream = _recognizer!.createStream();
    final micStream = await _recorder.startStream(
      const RecordConfig(
        sampleRate: 16000,
        numChannels: 1,
        encoder: AudioEncoder.pcm16bits,
      )
    );

    _isListening = true;

    // Test WAV
    debugPrint('Testing Sample WAV...');
    _testStream = _recognizer!.createStream();
    final wav = await rootBundle.load('assets/models/sherpa-onnx-streaming-zipformer-en-20M-2023-02-17/test_wavs/0.wav');
    final wavBytes = wav.buffer.asUint8List();

    final byteData = wav.buffer.asByteData();
    final riff = String.fromCharCodes(wavBytes.sublist(0, 4));  // Should be 'RIFF'
    final wave = String.fromCharCodes(wavBytes.sublist(8, 12)); // Should be 'WAVE'
    final format = String.fromCharCodes(wavBytes.sublist(12, 16)); // Should be 'fmt '
    final fmtSize = byteData.getUint32(16, Endian.little); // Should be 16 or 18
    final formatCode = byteData.getUint16(20, Endian.little); // Should be 1 for PCM
    final channels = byteData.getUint16(22, Endian.little);  // Should be 1 (mono)
    final sampleRate = byteData.getUint32(24, Endian.little); // Should be 16000
    final bitsPerSample = byteData.getUint16(34, Endian.little); // Should be 16
    final dataChunk = String.fromCharCodes(wavBytes.sublist(36, 40)); // Should be 'data'
    final dataSize = byteData.getUint32(40, Endian.little);

    debugPrint('WAV Header: RIFF=$riff, WAVE=$wave, fmt=$format, FmtSize=$fmtSize, FormatCode=$formatCode, Channels=$channels, SampleRate=$sampleRate, BitsPerSample=$bitsPerSample, DataChunk=$dataChunk, DataSize=$dataSize');

    if (formatCode != 1 || channels != 1 || sampleRate != 16000 || bitsPerSample != 16) {
      throw Exception('WAV file does not match expected format: PCM, mono, 16kHz, 16-bit.');
    }

    // Parse WAV to find data chunk
    int offset = 12; // Start after 'WAVE'
    Uint8List? audioData;
    while (offset < wavBytes.length - 8) {
      final chunkId = String.fromCharCodes(wavBytes.sublist(offset, offset + 4));
      final chunkSize = byteData.getUint32(offset + 4, Endian.little);
      if (chunkId == 'data') {
        audioData = wavBytes.sublist(offset + 8, offset + 8 + chunkSize);
        break;
      }
      offset += 8 + chunkSize;
      if (offset > wavBytes.length) break;
    }
    if (audioData == null) {
      throw Exception('No data chunk found in WAV.');
    }

    final testSamples = _pcm16ToFloat32List(audioData);
    _testStream?.acceptWaveform(samples: testSamples, sampleRate: 16000);
    while (_recognizer!.isReady(_testStream!)) {
      _recognizer!.decode(_testStream!);
    }
    _testStream?.inputFinished();  // Finalize the test stream to get complete results

    debugPrint('Started listening using stream...');
    _micSubscription = micStream.listen((Uint8List chunk) {
      final samples = _pcm16ToFloat32List(chunk);
      _stream?.acceptWaveform(samples: samples, sampleRate: 16000);

      while (_recognizer!.isReady(_stream!)) {
        debugPrint('Decoding...');
        _recognizer!.decode(_stream!);
      }
    });


    _pollTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (_stream!= null && _recognizer != null)
      {
        final testResult = _recognizer!.getResult(_testStream!);
        final result = _recognizer!.getResult(_stream!);
        _partialTextController.add(testResult.text);
        _partialTextController.add("Real Result: ");
        _partialTextController.add(result.text);
        debugPrint('Partial text: ${result.text}');
        debugPrint('Test text: ${testResult.text}');
      }
    });
  }

  Future<String> stopListening() async {
    debugPrint('Stopping listening...');
    if (!_isListening) return '';

    _pollTimer?.cancel();
    _pollTimer = null;

    await _micSubscription?.cancel();
    _micSubscription = null;

    await _recorder.stop();

    _stream?.inputFinished();

    if(_recognizer != null && _stream != null) {
      while (_recognizer!.isReady(_stream!)) {
        _recognizer!.decode(_stream!);
      }

      final result = _recognizer!.getResult(_stream!);

      _isListening = false;
      _partialTextController.add(result.text);
      debugPrint('Final text: ${result.text}');

      return result.text;
    }

    _isListening = false;
    debugPrint('Stopped listening.');
    return '';
  }

  Float32List _pcm16ToFloat32List(Uint8List bytes) {
    final sampleCount = bytes.length ~/ 2;
    final out = Float32List(sampleCount);
    final byteData = bytes.buffer.asByteData(bytes.offsetInBytes, bytes.length);

    for (int i = 0; i < sampleCount; i++) {
      final sample = byteData.getInt16(i * 2, Endian.little);
      out[i] = sample / 32768.0;
    }

    return out;
  }

  Future<void> dispose() async {
    _pollTimer?.cancel();
    await _micSubscription?.cancel();
    await _recorder.dispose();
    await _partialTextController.close();
  }

  Future<void> initSherpa() async {
    if (_bindingsInitialized) return;

    initBindings();
    _bindingsInitialized = true;
  }
}