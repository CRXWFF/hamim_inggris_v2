import 'package:get/get.dart';
import 'routes.dart';
import '../app.dart';
import '../ui/screens/onboarding/onboarding_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/pilih_bahasa/pilih_bahasa_screen.dart';
import '../ui/screens/welcome/welcome.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => const LaunchDecider()),
    GetPage(name: Routes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: Routes.pilih, page: () => const PilihBahasaScreen()),
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.welcome, page: () => const WelcomeScreen()),
  ];
}
