import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Settings", style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white,),
            onPressed: (){},
        )],
      ),
      backgroundColor: Color(0xff242424),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              const Text("Voice Settings", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            ], 
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(width: 12),
              const Text("Input Sensitivity", style: TextStyle(color: Colors.white, fontSize: 20,),),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(width: 12),
              const Text("Themes and Wallpapers", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(width: 12),
              const Text("Dark Theme", style: TextStyle(color: Colors.white, fontSize: 20,),),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(width: 12),
              const Text("Light Theme", style: TextStyle(color: Colors.white, fontSize: 20,),),
            ],
          ),
        ]
      ),
    );
  }
}