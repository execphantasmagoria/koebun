import 'package:flutter/material.dart';

class TranscriptionModelPage extends StatefulWidget {
  const TranscriptionModelPage({super.key});

  @override
  State<TranscriptionModelPage> createState() => _TranscriptionModelPageState();
}

class _TranscriptionModelPageState extends State<TranscriptionModelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Transcription Model", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xff242424),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select a different transcription model, download additional models or provide API key for an online model. Different models offer different levels of accuracy, speed and streaming capabilities.", style: const TextStyle(color: Colors.white54, fontSize: 16),),
              const SizedBox(height: 12,),
              Text("Downloaded Models: ", style: const TextStyle(color: Colors.white54, fontSize: 16, fontWeight: FontWeight(500)),),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xff292929),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Model $index", style: const TextStyle(color: Colors.white54, fontSize: 18, fontWeight: FontWeight(500)),),
                            const Spacer(),
                            Text("2.5 GB", style: const TextStyle(color: Colors.white54),),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.white54,),
                              onPressed: (){},
                            )
                        ]),
                        Row(
                          children: [
                            Text("Accuracy: ", style: const TextStyle(color: Colors.white54),),
                            SizedBox(width: 100, child: LinearProgressIndicator(value: 0.5, minHeight: 8, borderRadius: BorderRadius.circular(99),)),
                            const Spacer(),
                            Text("Speed: ", style: const TextStyle(color: Colors.white54),),
                            SizedBox(width: 100, child: LinearProgressIndicator(value: 0.7, minHeight: 8, borderRadius: BorderRadius.circular(99),)),

                          ],
                        )
                    ])
                  );
                },
              ),
              const SizedBox(height: 12,),
              Text("Available Models: ", style: const TextStyle(color: Colors.white54, fontSize: 16, fontWeight: FontWeight(500)),),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 6,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xff292929),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Model $index", style: const TextStyle(color: Colors.white54, fontSize: 18, fontWeight: FontWeight(500)),),
                            const Spacer(),
                            Text("2.5 GB", style: const TextStyle(color: Colors.white54),),
                            IconButton(
                              icon: const Icon(Icons.download, color: Colors.white54,),
                              onPressed: (){},
                            )
                        ]),
                        Row(
                          children: [
                            Text("Accuracy: ", style: const TextStyle(color: Colors.white54),),
                            SizedBox(width: 100, child: LinearProgressIndicator(value: 0.5, minHeight: 8, borderRadius: BorderRadius.circular(99),)),
                            const Spacer(),
                            Text("Speed: ", style: const TextStyle(color: Colors.white54),),
                            SizedBox(width: 100, child: LinearProgressIndicator(value: 0.7, minHeight: 8, borderRadius: BorderRadius.circular(99),)),

                          ],
                        )
                    ])
                  );
                },
              ),
              const SizedBox(height: 12,),
              Text("API Key: ", style: const TextStyle(color: Colors.white54, fontSize: 20, fontWeight: FontWeight(500)),),
            ],
          ),
        )
      )
    );
  }
}