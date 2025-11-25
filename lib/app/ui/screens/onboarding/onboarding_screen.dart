import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import '../home/home_screen.dart';
import 'widgets/logo.dart';

// Onboarding statis khusus untuk debugging dengan tap layar penuh untuk lanjut

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  // Onboarding sengaja dinyalain statis untuk debugging (selalu ditampilkan)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            highlightColor: Colors.white10,
            onTap: () {
              // navigasi tanpa ada animasinya
              Get.offAll(
                const HomeScreen(),
                transition: Transition.noTransition,
              );
            },
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Logo area
                  const Center(child: OnboardingLogo()),
                  const Spacer(),
                  // Gk ada button jadi dibuat bisa tap dimana aja
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
