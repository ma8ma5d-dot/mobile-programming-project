import 'package:flutter/material.dart';
import 'login_page.dart';
import 'student_registration_page.dart';
import 'user_input_page.dart';
import 'student_management_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  Future<void> _confirmExit(BuildContext context) async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('تأیید خروج'),
        content: const Text('آیا مطمئن هستید که می‌خواهید از این صفحه خارج شوید؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('انصراف'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('بله، خروج'),
          ),
        ],
      ),
    );

    if (shouldExit == true && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('درخواست خروج تأیید شد.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = <(String, String, IconData, Widget)>[
      ('تمرین اول: اپلیکیشن دوصفحه‌ای', 'باز کردن صفحه دوم و نمایش نام دانشجو', Icons.open_in_new, const SecondPageDemo()),
      ('تمرین دوم: فرم ورود', 'اعتبارسنجی نام کاربری و رمز عبور', Icons.login, const LoginPage()),
      ('تمرین سوم: ثبت اطلاعات دانشجو', 'فرم کامل همراه با اعتبارسنجی فیلدها', Icons.assignment_ind, const StudentRegistrationPage()),
      ('تمرین چهارم: ارسال اطلاعات بین صفحات', 'انتقال نام و سن به صفحه پروفایل', Icons.swap_horiz, const UserInputPage()),
      ('تمرین ششم: مدیریت دانشجو', 'صفحه اصلی، ثبت و نمایش اطلاعات', Icons.school, const StudentManagementPage()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('آزمایشگاه Flutter'),
        actions: [
          IconButton(
            tooltip: 'تأیید خروج',
            onPressed: () => _confirmExit(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('مجموعه تمرین‌های عملی', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('هر تمرین را انتخاب کنید تا صفحه مربوط به آن باز شود.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((item) => Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(item.$3)),
              title: Text(item.$1),
              subtitle: Text(item.$2),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _open(context, item.$4),
            ),
          )),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.warning_amber)),
              title: const Text('تمرین پنجم: Dialog تأیید خروج'),
              subtitle: const Text('با دکمه خروج در نوار بالای همین صفحه امتحان کنید.'),
              trailing: const Icon(Icons.logout),
              onTap: () => _confirmExit(context),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPageDemo extends StatelessWidget {
  const SecondPageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحه اول')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StudentNamePage()),
            );
          },
          child: const Text('رفتن به صفحه دوم'),
        ),
      ),
    );
  }
}

class StudentNamePage extends StatelessWidget {
  const StudentNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحه دوم')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, size: 72, color: Colors.indigo),
            SizedBox(height: 12),
            Text('نام دانشجو: محمد احمدی', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
