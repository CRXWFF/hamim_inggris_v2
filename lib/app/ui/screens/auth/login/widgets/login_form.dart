import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // For now we just show a snackbar via Get
      Get.snackbar(
        'Info',
        'Memproses login...',
        snackPosition: SnackPosition.TOP,
      );
      // Caller (LoginActions) is responsible for final navigation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Masukkan email' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Masukkan password' : null,
          ),
          const SizedBox(height: 12),
          // small submit helper to allow actions widget to call
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: _submit, child: const Text('Periksa')),
          ),
        ],
      ),
    );
  }
}
