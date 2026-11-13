import 'package:flutter/material.dart';

class StudentManagementPage extends StatefulWidget {
  const StudentManagementPage({super.key});

  @override
  State<StudentManagementPage> createState() => _StudentManagementPageState();
}

class _StudentManagementPageState extends State<StudentManagementPage> {
  final List<StudentData> _students = [];

  Future<void> _openRegistration() async {
    final student = await Navigator.push<StudentData>(
      context,
      MaterialPageRoute(builder: (_) => const StudentAddPage()),
    );

    if (student != null && mounted) {
      setState(() => _students.add(student));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('دانشجو با موفقیت به فهرست اضافه شد.')),
      );
    }
  }

  void _showStudent(StudentData student) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => StudentDetailsPage(student: student)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مدیریت دانشجویان')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openRegistration,
        icon: const Icon(Icons.person_add),
        label: const Text('ثبت دانشجو'),
      ),
      body: _students.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.groups_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('هنوز دانشجویی ثبت نشده است.'),
                  Text('برای شروع، دکمه ثبت دانشجو را بزنید.'),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _students.length,
              itemBuilder: (context, index) {
                final student = _students[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(student.fullName),
                    subtitle: Text(student.major),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showStudent(student),
                  ),
                );
              },
            ),
    );
  }
}

class StudentData {
  final String fullName;
  final String studentId;
  final String major;
  final String phone;
  final String email;

  const StudentData({
    required this.fullName,
    required this.studentId,
    required this.major,
    required this.phone,
    required this.email,
  });
}

class StudentAddPage extends StatefulWidget {
  const StudentAddPage({super.key});

  @override
  State<StudentAddPage> createState() => _StudentAddPageState();
}

class _StudentAddPageState extends State<StudentAddPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _id = TextEditingController();
  final _major = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _id.dispose();
    _major.dispose();
    _phone.dispose();
    _email.dispose();
    super.dispose();
  }

  String? _required(String? value, String label) =>
      value == null || value.trim().isEmpty ? '$label را وارد کنید.' : null;

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final student = StudentData(
      fullName: _name.text.trim(),
      studentId: _id.text.trim(),
      major: _major.text.trim(),
      phone: _phone.text.trim(),
      email: _email.text.trim(),
    );
    Navigator.pop(context, student);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ثبت دانشجوی جدید')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            TextFormField(controller: _name, decoration: const InputDecoration(labelText: 'نام و نام خانوادگی', border: OutlineInputBorder()), validator: (v) => _required(v, 'نام')),
            const SizedBox(height: 12),
            TextFormField(controller: _id, decoration: const InputDecoration(labelText: 'شماره دانشجویی', border: OutlineInputBorder()), validator: (v) => _required(v, 'شماره دانشجویی')),
            const SizedBox(height: 12),
            TextFormField(controller: _major, decoration: const InputDecoration(labelText: 'رشته تحصیلی', border: OutlineInputBorder()), validator: (v) => _required(v, 'رشته')),
            const SizedBox(height: 12),
            TextFormField(controller: _phone, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'شماره تلفن', border: OutlineInputBorder()), validator: (v) {
              final error = _required(v, 'شماره تلفن');
              if (error != null) return error;
              if (v!.replaceAll(RegExp(r'\D'), '').length < 10) return 'شماره تلفن معتبر وارد کنید.';
              return null;
            }),
            const SizedBox(height: 12),
            TextFormField(controller: _email, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'ایمیل', border: OutlineInputBorder()), validator: (v) {
              final error = _required(v, 'ایمیل');
              if (error != null) return error;
              if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v!.trim())) return 'ایمیل معتبر وارد کنید.';
              return null;
            }),
            const SizedBox(height: 18),
            FilledButton.icon(onPressed: _save, icon: const Icon(Icons.save), label: const Text('ذخیره و نمایش')),
          ],
        ),
      ),
    );
  }
}

class StudentDetailsPage extends StatelessWidget {
  final StudentData student;
  const StudentDetailsPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final details = <(String, String, IconData)>[
      ('نام و نام خانوادگی', student.fullName, Icons.person),
      ('شماره دانشجویی', student.studentId, Icons.badge),
      ('رشته تحصیلی', student.major, Icons.school),
      ('شماره تلفن', student.phone, Icons.phone),
      ('ایمیل', student.email, Icons.email),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('اطلاعات دانشجو')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 42, child: Icon(Icons.person, size: 48)),
          const SizedBox(height: 16),
          ...details.map((item) => Card(
            child: ListTile(
              leading: Icon(item.$3),
              title: Text(item.$1),
              subtitle: Text(item.$2),
            ),
          )),
        ],
      ),
    );
  }
}
