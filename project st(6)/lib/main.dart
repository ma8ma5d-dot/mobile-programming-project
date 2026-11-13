import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const StudentLabApp());
}

class StudentLabApp extends StatelessWidget {
  const StudentLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تمرین‌های عملی Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
