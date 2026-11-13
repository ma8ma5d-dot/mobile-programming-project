import 'package:flutter/material.dart';

void main() {
  runApp(const CenterTextApp());
}

class CenterTextApp extends StatelessWidget {
  const CenterTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('تمرین ۸')),
        body: const Center(
          child: Text(
            'برنامه‌نویسی موبایل',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
