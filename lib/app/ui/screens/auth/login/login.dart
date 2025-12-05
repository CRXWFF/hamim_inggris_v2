import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/routes/routes.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/back_button.dart';
import 'widgets/login_form.dart';
import 'widgets/login_actions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  AppBackButton(onPressed: () => Get.back(), size: 44),
                ],
              ),

              const SizedBox(height: 28),
              const Text(
                'Masuk',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Masuk untuk melanjutkan ke aplikasi',
                style: TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 24),

              // form and actions separated into widgets
              const LoginForm(),

              const SizedBox(height: 12),

              LoginActions(
                onLogin: () {
                  // Temporary fake login action
                  Get.snackbar(
                    'Berhasil',
                    'Login berhasil',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.green,
                    colorText: Colors.black,
                  );
                  // navigate to home if available
                  try {
                    Get.offAllNamed(Routes.home);
                  } catch (_) {
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
