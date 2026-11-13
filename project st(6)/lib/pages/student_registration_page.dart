import 'package:flutter/material.dart';

class StudentRegistrationPage extends StatefulWidget {
  const StudentRegistrationPage({super.key});

  @override
  State<StudentRegistrationPage> createState() => _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _majorController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _studentIdController.dispose();
    _majorController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _required(String? value, String field) {
    return value == null || value.trim().isEmpty ? '$field را وارد کنید.' : null;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('ثبت اطلاعات انجام شد'),
        content: Text(
          'نام: ${_nameController.text.trim()}\n'
          'شماره دانشجویی: ${_studentIdController.text.trim()}\n'
          'رشته: ${_majorController.text.trim()}\n'
          'تلفن: ${_phoneController.text.trim()}\n'
          'ایمیل: ${_emailController.text.trim()}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('متوجه شدم'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ثبت اطلاعات دانشجو')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'نام و نام خانوادگی', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
              validator: (v) => _required(v, 'نام و نام خانوادگی'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _studentIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'شماره دانشجویی', border: OutlineInputBorder(), prefixIcon: Icon(Icons.badge)),
              validator: (v) {
                final required = _required(v, 'شماره دانشجویی');
                if (required != null) return required;
                if (!RegExp(r'^\d{5,15}$').hasMatch(v!.trim())) return 'شماره دانشجویی باید ۵ تا ۱۵ رقم باشد.';
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _majorController,
              decoration: const InputDecoration(labelText: 'رشته تحصیلی', border: OutlineInputBorder(), prefixIcon: Icon(Icons.school)),
              validator: (v) => _required(v, 'رشته تحصیلی'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'شماره تلفن', border: OutlineInputBorder(), prefixIcon: Icon(Icons.phone)),
              validator: (v) {
                final required = _required(v, 'شماره تلفن');
                if (required != null) return required;
                final digits = v!.replaceAll(RegExp(r'\D'), '');
                if (digits.length < 10 || digits.length > 13) return 'شماره تلفن معتبر وارد کنید.';
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'ایمیل', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
              validator: (v) {
                final required = _required(v, 'ایمیل');
                if (required != null) return required;
                if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v!.trim())) return 'ساختار ایمیل صحیح نیست.';
                return null;
              },
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.save),
              label: const Text('ثبت اطلاعات'),
            ),
          ],
        ),
      ),
    );
  }
}
