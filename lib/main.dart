import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.k9y&%7w2o@aZkTL2^%tYZ1pev
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String selectedWorkspace = 'Parakeet V2';
  int bottomIndex = 0;

  final List<Map<String, String>> items = List.generate(
    20,
    (i) => {
      'title': 'Note ${i + 1}',
      'subtitle': 'Last edited a few minutes ago',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: items.length + 1,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              if (index == 0) {
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  child: Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedWorkspace,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          items: const [
                            DropdownMenuItem(
                              value: 'Parakeet V2',
                              child: Text('Parakeet V2'),
                            ),
                            DropdownMenuItem(
                              value: 'Whisper',
                              child: Text('Whisper'),
                            ),
                            DropdownMenuItem(
                              value: 'ParakeetV1',
                              child: Text('Parakeet V1'),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => selectedWorkspace = value);
                            }
                          },
                        ),
                      ),
                    ),
                );
              }
              // Footer
              if (index == items.length) {
                return const Text('Footer');
              }
              final item = items[index - 1];
              return ListTile(
                tileColor: index % 2 == 0 ? Colors.grey.shade100 : Colors.grey.shade300,
                title: Text(item['title']!),
                subtitle: Text(item['subtitle']!),
                selectedColor: Colors.grey.shade200,
                onTap: () {},
              );
            },
          ),
        ),
      ),
      backgroundColor: const Color(0xfff4f4f4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            children: [
              Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                        icon: const Icon(Icons.menu),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Centered Text
                    Expanded(
                      child: Center(
                        child: Text(
                          selectedWorkspace,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: const Icon(Icons.copy_outlined),
                        onPressed: () {},
                    ),
                    // 3 dots icon
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text("Context: Lecture about Physics", style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.left,),
              const SizedBox(height: 6),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra tortor vel nisl pellentesque viverra. Quisque eget nunc vel tortor fringilla hendrerit. Sed vehicula tincidunt enim vitae auctor. Nunc pretium sapien at justo condimentum, non commodo ligula auctor. Sed eget ipsum risus. Aliquam euismod massa mauris, nec tincidunt ex posuere non. Mauris tristique ex ac aliquet hendrerit. Nullam quis nisl arcu. Proin tincidunt urna magna, eget finibus sem pulvinar vitae. Maecenas gravida tellus a aliquam malesuada. Vivamus elit nisl, commodo non massa et, fermentum sollicitudin felis. Praesent et mi diam. Duis suscipit ornare justo, in condimentum mauris euismod quis. Fusce tincidunt pretium neque quis viverra. Sed sit amet hendrerit leo. Curabitur luctus odio ut est tincidunt, euismod convallis libero facilisis. In hac habitasse platea dictumst. Ut lectus felis, pharetra sit amet velit et, ultrices luctus dolor. Nullam congue faucibus enim. Curabitur condimentum pulvinar lacus quis ornare. Sed nibh nisi, consectetur in molestie sit amet, vulputate vitae est. In nec pellentesque erat. Aenean sodales enim non egestas fermentum. Donec et felis interdum, tempus mi vel, eleifend arcu. Vestibulum vel commodo eros, vitae efficitur eros. Nullam quis sem nec neque viverra luctus. Etiam non hendrerit tellus, eget congue nunc. Etiam et ex sed elit rutrum feugiat vel ac sem. Nulla dui enim, ullamcorper in posuere id, egestas et dolor. Vivamus cursus erat ac lacinia tincidunt. Nunc a risus venenatis, lacinia lectus eu, tristique libero. Suspendisse vel turpis tempus, viverra metus ac, fringilla urna. Ut id turpis nec ex pretium mattis eu ut tellus. Fusce metus risus, porttitor vel dignissim quis, iaculis nec nisi. Vivamus ullamcorper massa massa."),
              // FAB at bottom right
              const Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
    );
  }
}