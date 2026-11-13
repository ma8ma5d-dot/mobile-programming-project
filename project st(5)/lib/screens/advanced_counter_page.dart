import 'package:flutter/material.dart';

class AdvancedCounterPage extends StatefulWidget {
  const AdvancedCounterPage({super.key});

  @override
  State<AdvancedCounterPage> createState() => _AdvancedCounterPageState();
}

class _AdvancedCounterPageState extends State<AdvancedCounterPage> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شمارنده پیشرفته')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('مقدار شمارنده', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: increaseCounter,
                  icon: const Icon(Icons.add),
                  label: const Text('افزایش شمارنده'),
                ),
                OutlinedButton.icon(
                  onPressed: resetCounter,
                  icon: const Icon(Icons.refresh),
                  label: const Text('صفرکردن شمارنده'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
