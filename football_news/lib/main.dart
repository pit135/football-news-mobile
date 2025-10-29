import 'package:flutter/material.dart';
import 'package:football_news/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football News',
      theme: ThemeData(
        // LANGKAH 1: ubah tema warna aplikasi
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.blueAccent[400],
        ),
        useMaterial3: true,
      ),
      // LANGKAH 2: panggil MyHomePage() tanpa const dan tanpa title
      home: MyHomePage(),
    );
  }
}
