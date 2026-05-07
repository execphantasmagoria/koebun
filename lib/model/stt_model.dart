import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/stt_service.dart';

class SttModel extends ChangeNotifier {
  final STTService _service = STTService();

  bool _isReady = false;
  bool _isListening = false;
  bool _isLoading = false;
  String _text = '';
  String _error = '';

  StreamSubscription<String>? _partialSub;

  bool get isReady => _isReady;
  bool get isListening => _isListening;
  bool get isLoading => _isLoading;
  String get text => _text;
  String get error => _error;

  Stream<String> get partialTextStream => _service.partialText;

  Future<void> init() async {
    try {
      debugPrint('Initializing...');
      _isLoading = true;
      _error = '';
      notifyListeners();

      await _service.initialize();
      debugPrint('Initialized via service...');

      _isReady = true;
      debugPrint('Ready');
    } catch (e) {
      _error = e.toString();
      debugPrint('Error: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void bindPartialUpdates(void Function(String text) onText) {
    _partialSub?.cancel();
    _partialSub = partialTextStream.listen((text) {
      _text = text;
      onText(text);
      notifyListeners();
    });
  }

  Future<void> startListening() async {
    debugPrint('_isReady: $_isReady, _isListening: $_isListening');
    if (!_isReady || _isListening) return;

    try {
      _error = '';
      _isListening = true;
      notifyListeners();

      await _service.startListening();
      debugPrint('Started listening via service...');
    } catch (e) {
      _error = e.toString();
      debugPrint('Error: $_error');
      _isListening = false;
      notifyListeners();
    }
  }

  Future<String> stopListening() async {
    try {
      final result = await _service.stopListening();
      _text = result;
      _isListening = false;
      notifyListeners();
      return result;
    } catch (e) {
      _error = e.toString();
      _isListening = false;
      notifyListeners();
      return '';
    }
  }

  void clear() {
    _text = '';
    notifyListeners();
  }

  @override
  void dispose() {
    _partialSub?.cancel();
    _service.dispose();
    super.dispose();
  }
}