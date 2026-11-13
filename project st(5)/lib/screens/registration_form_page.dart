import 'package:flutter/material.dart';

class RegistrationFormPage extends StatefulWidget {
  const RegistrationFormPage({super.key});

  @override
  State<RegistrationFormPage> createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _fieldController = TextEditingController();
  String? submittedInfo;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _fieldController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      submittedInfo =
          'نام: ${_firstNameController.text.trim()}\n'
          'نام خانوادگی: ${_lastNameController.text.trim()}\n'
          'رشته تحصیلی: ${_fieldController.text.trim()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('فرم ثبت‌نام ساده')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'نام',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) =>
                      value == null || value.trim().isEmpty ? 'نام را وارد کنید' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'نام خانوادگی',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'نام خانوادگی را وارد کنید'
                      : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _fieldController,
                  decoration: const InputDecoration(
                    labelText: 'رشته تحصیلی',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.school_outlined),
                  ),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'رشته تحصیلی را وارد کنید'
                      : null,
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: submitForm,
                    child: const Text('ثبت اطلاعات'),
                  ),
                ),
              ],
            ),
          ),
          if (submittedInfo != null) ...[
            const SizedBox(height: 22),
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'اطلاعات ثبت‌شده',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(submittedInfo!, style: const TextStyle(fontSize: 16, height: 1.8)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
