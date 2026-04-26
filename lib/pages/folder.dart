import 'package:flutter/material.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Koebun Folder", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xff242424),
      body: Center(
        child: Text("Folder", style: const TextStyle(color: Colors.white54, fontSize: 20),),
      ),
    );
  }
}