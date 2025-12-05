import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginActions extends StatelessWidget {
  final VoidCallback onLogin;

  const LoginActions({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onLogin,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Masuk'),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => Get.snackbar('Info', 'Masih dalam pengembangan.'),
          child: const Text('Lupa password?'),
        ),
      ],
    );
  }
}
