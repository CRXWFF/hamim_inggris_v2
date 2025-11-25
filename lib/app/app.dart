import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/routes.dart';
import 'routes/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HAMIM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEB8A4D)),
        useMaterial3: true,
      ),
      // Make navigations instantaneous by default (no animation)
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration.zero,
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}

/// A small widget that decides where to go on app start.
class LaunchDecider extends StatelessWidget {
  const LaunchDecider({super.key});

  // Set to true during development to always show onboarding.
  static const bool forceOnboardingForDebug = true;

  Future<void> _decide() async {
    if (forceOnboardingForDebug) {
      Get.offAllNamed(Routes.onboarding);
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool('seen_onboarding') ?? false;
    if (seen) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    // trigger decision after build
    WidgetsBinding.instance.addPostFrameCallback((_) => _decide());
    return Scaffold(
      backgroundColor: const Color(0xFFEB8A4D),
      body: const Center(),
    );
  }
}
