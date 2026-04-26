import 'package:flutter/material.dart';
import 'package:koebun/pages/settings.dart';
import 'package:koebun/routes.dart';
import 'package:koebun/permissions.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.k9y&%7w2o@aZkTL2^%tYZ1pev
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koebun',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.grey),
      ),
      onGenerateRoute: Routes.generateRoute,
      home: const KoebunHomePage(title: 'Koebun Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class KoebunHomePage extends StatefulWidget {
  const KoebunHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<KoebunHomePage> createState() => _KoebunHomePageState();
}

class _KoebunHomePageState extends State<KoebunHomePage> {
  int bottomIndex = 0;
  String content = 'Tap mic to start recording...';

  final List<Map<String, String>> items = List.generate(
    8,
    (i) => {
      'title': 'Note ${i + 1}',
      'subtitle': 'Last edited a few minutes ago',
    },
  );

  void _showQuickTray(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, 
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
          decoration: const BoxDecoration(
            color: Color(0xff242424),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
              )
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 3.5,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _TrayItem(Icons.share_rounded, 'Share', (){} ),
                    _TrayItem(Icons.book, 'Dictionary', (){} ),
                    _TrayItem(Icons.clear, 'Clear Text', (){}),
                    _TrayItem(Icons.download, 'Export', (){}),
                    _TrayItem(Icons.find_replace, 'Find and Replace', (){}),
                    // Navigate to Settings Page by Navigator.Pop and Navigator.Push
                    _TrayItem(Icons.settings, 'Settings', (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/settings');
                    }),
                  ],
                ),
                Text("Koebun v0.1a", style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xff242424),
        child: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
            itemCount: items.length + 1,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xff242424),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    "Past Transcripts",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ))
                );
              }
              final item = items[index - 1];
              return ListTile(
                tileColor: index % 2 == 0 ? Color(0xff292929) : Color(0xff242424),
                title: Text(item['title']!, style: const TextStyle(color: Colors.white54),),
                subtitle: Text(item['subtitle']!, style: const TextStyle(color: Colors.white24)),
                selectedColor: Color(0xff262626),
                onTap: () {},
              );
            },
          ),
        ),
      ),
      backgroundColor: const Color(0xff242424),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            children: [
              Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xff252525),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 14,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white54,),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Centered Text
                    Expanded(
                      child: Center(
                        child: Text(
                          "Koebun",
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.copy_outlined, color: Colors.white54),
                        onPressed: () {},
                    ),
                    // 3 dots icon
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white54),
                      onPressed: () => _showQuickTray(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text("Context: Lecture about Physics", style: const TextStyle(color: Colors.white24, fontSize: 14)),
              const SizedBox(height: 6),
              Text(content, style: const TextStyle(color: Colors.white54)),
              // FAB at bottom right
              const Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
                onPressed: () async { 
                  var isGranted = await handlePermission(Permission.microphone, "Microphone");
                  content = isGranted ? "Listening..." : "Permission Denied";
                  setState(() {});
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.mic, color: Colors.black87,),
              ),
    );
  }
}

class _TrayItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onTap;

  const _TrayItem(this.icon, this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xff242424),
            borderRadius: BorderRadius.circular(14)
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white,),
              const SizedBox(width: 10),
              Expanded(
                child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ],
          ),
        )
      ),
    );
  }
}