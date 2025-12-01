import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/onboarding');
              },
              child: const Text('Kembali ke Onboarding'),
            ),
          ],
        ),
      ),
    );
  }
}
