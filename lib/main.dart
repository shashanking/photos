import 'package:flutter/material.dart';
import 'package:photos/features/photos/ui/photos_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotosPage(),
    );
  }
}
