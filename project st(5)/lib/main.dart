import 'package:flutter/material.dart';
import 'screens/student_profile_page.dart';
import 'screens/advanced_counter_page.dart';
import 'screens/registration_form_page.dart';
import 'screens/student_card_page.dart';

void main() {
  runApp(const LabExercisesApp());
}

class LabExercisesApp extends StatelessWidget {
  const LabExercisesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تمرین‌های عملی Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        fontFamily: 'Roboto',
      ),
      home: const ExercisesHomePage(),
    );
  }
}

class ExercisesHomePage extends StatelessWidget {
  const ExercisesHomePage({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final exercises = <(String, IconData, Widget)>[
      ('تمرین اول: معرفی دانشجو', Icons.person, const StudentProfilePage()),
      ('تمرین دوم: شمارنده پیشرفته', Icons.exposure_plus_1, const AdvancedCounterPage()),
      ('تمرین سوم: فرم ثبت‌نام', Icons.app_registration, const RegistrationFormPage()),
      ('تمرین چهارم: کارت اطلاعات', Icons.badge, const StudentCardPage()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('تمرین‌های عملی Flutter')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = exercises[index];
          return Card(
            child: ListTile(
              leading: Icon(item.$2, color: Theme.of(context).colorScheme.primary),
              title: Text(item.$1),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _open(context, item.$3),
            ),
          );
        },
      ),
    );
  }
}
