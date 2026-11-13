import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('معرفی دانشجو')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 58,
              backgroundColor: Color(0xFFE8EAF6),
              child: Icon(Icons.person, size: 72, color: Colors.indigo),
            ),
            const SizedBox(height: 20),
            const Text(
              'نام: محمد احمدی',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('رشته: مهندسی نرم‌افزار کامپیوتر', style: TextStyle(fontSize: 17)),
            const SizedBox(height: 10),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.badge_outlined, color: Colors.indigo),
                SizedBox(width: 8),
                Text('شماره دانشجویی: ۴۰۲۱۲۳۴۵۶', style: TextStyle(fontSize: 17)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
