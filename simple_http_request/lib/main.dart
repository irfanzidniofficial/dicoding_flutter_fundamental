import 'package:flutter/material.dart';
import 'package:simple_http_request/data/ui/album_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AlbumPage(),
    );
  }
}
