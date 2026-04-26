import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<bool> isSelected = [true, false];

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
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(width: 16),
              Icon(Icons.mic, color: Colors.white, size: 30,),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Microphone Sensitivity", style: TextStyle(color: Colors.white, fontSize: 20,),),
                    Text("60%", style: TextStyle(color: Colors.white24, fontSize: 14,),),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.text_fields, color: Colors.white),
              const SizedBox(width: 12),
              const Text("Context Font Size", style: TextStyle(color: Colors.white, fontSize: 20,),),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 48),
              const Text("16 (default)", style: TextStyle(color: Colors.white24, fontSize: 14,),),
          ]),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.text_fields, color: Colors.white),
              const SizedBox(width: 12),
              const Text("Transcript font Size", style: TextStyle(color: Colors.white, fontSize: 20,),),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 48),
              const Text("18 (default)", style: TextStyle(color: Colors.white24, fontSize: 14,),),
          ]),
          const SizedBox(height: 12,),
          Divider(
            color: Colors.white12,
            thickness: 1,
          ),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.palette, color: Colors.white),
              const SizedBox(width: 12),
              const Text("Appearance", style: TextStyle(color: Colors.white, fontSize: 20,),),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 48),
              const Text("Change the theme, wallpaper, etc.", style: TextStyle(color: Colors.white24, fontSize: 14,),),
          ]),
          const SizedBox(height: 12,),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.dark_mode, color: Colors.white),
              const SizedBox(width: 12),
              const Text("Dark Mode", style: TextStyle(color: Colors.white, fontSize: 20,),),
              const Spacer(),
              Switch(
                value: isSelected[1],
                onChanged: (bool value) {
                  setState(() {
                    isSelected[0] = !value;
                    isSelected[1] = value;
                  });
                },
              ),
              const SizedBox(width: 18),
            ],
          ),
        ]
      ),
    );
  }
}