import 'package:flutter/material.dart';

class MicSensitivityPage extends StatefulWidget {
  const MicSensitivityPage({super.key});

  @override
  State<MicSensitivityPage> createState() => _MicSensitivityPageState();
}

class _MicSensitivityPageState extends State<MicSensitivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Microphone Sensitivity", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xff242424),
      body: Center(
        child: Text("Mic Settings", style: const TextStyle(color: Colors.white54, fontSize: 20),),
      ),
    );
  }
}