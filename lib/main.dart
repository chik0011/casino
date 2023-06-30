import 'package:flutter/material.dart';
import 'casino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const Casino casino = Casino(title: 'Casino');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casino',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: casino,
      debugShowCheckedModeBanner: false,
    );
  }
}
