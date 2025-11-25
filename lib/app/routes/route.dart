import 'package:get/get.dart';
import '../app.dart';
import '../ui/screens/onboarding/onboarding_screen.dart';
import '../ui/screens/home/home_screen.dart';

class Routes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const home = '/home';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => const LaunchDecider()),
    GetPage(name: Routes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: Routes.home, page: () => const HomeScreen()),
  ];
}
