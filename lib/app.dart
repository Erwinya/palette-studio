import 'package:flutter/material.dart';

class PaletteStudioApp extends StatelessWidget {
  const PaletteStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palette Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF245B4A)),
        useMaterial3: true,
      ),
      // StudioScreen lands in a follow-up commit.
      home: Scaffold(
        appBar: AppBar(title: const Text('Palette Studio')),
        body: const Center(
          child: Text('Palette UI lands in a follow-up commit.'),
        ),
      ),
    );
  }
}
