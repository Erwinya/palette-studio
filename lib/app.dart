import 'package:flutter/material.dart';
import 'package:palette_studio/screens/studio_screen.dart';

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
      home: const StudioScreen(),
    );
  }
}