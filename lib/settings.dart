import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool isIncognito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color(0xff242424),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 16),
              Icon(Icons.mic, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Microphone Sensitivity",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "60%",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.text_fields, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Context Font Size",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "16(default)",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.text_fields, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Transcript Font Size",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "18(default)",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.mic, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Speech Model Settings",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Parakeet V2",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.mic, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Home Floating Action Button mode",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Single click to start recording",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.palette, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Appearance",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Change the theme, wallpaper, etc.",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.folder, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Koebun Folder",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Documents/Koebun",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.language, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Language Model Settings",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Gemma",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.security, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Security and Privacy",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "App lock, secure screen, etc.",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.delete, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Clear All Transcripts",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text("Delete all the stored transcripts",
                        style: TextStyle(color: Colors.white24, fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(width: 18),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.dark_mode, color: Colors.white),
              const SizedBox(width: 12),
              const Text(
                "Dark Mode",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(),
              Switch(
                value: isDarkMode,
                onChanged: (bool value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
              const SizedBox(width: 18),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.privacy_tip, color: Colors.white),
              const SizedBox(width: 12),
              const Text(
                "Incognito Mode",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(),
              Switch(
                value: isIncognito,
                onChanged: (bool value) {
                  setState(() {
                    isIncognito = value;
                  });
                },
              ),
              const SizedBox(width: 18),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Icon(Icons.info, color: Colors.white, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "About",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Koebun Stable v1.0.0",
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
            ],
          ),
        ],
      ),
    );
  }
}
