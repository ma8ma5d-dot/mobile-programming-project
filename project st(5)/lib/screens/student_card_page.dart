import 'package:flutter/material.dart';

class StudentCardPage extends StatelessWidget {
  const StudentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('کارت اطلاعات دانشجو')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 34,
                    backgroundColor: Color(0xFFE8EAF6),
                    child: Icon(Icons.school, size: 38, color: Colors.indigo),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'محمد احمدی',
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('مهندسی نرم‌افزار کامپیوتر'),
                        SizedBox(height: 5),
                        Text('شماره دانشجویی: ۴۰۲۱۲۳۴۵۶'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
