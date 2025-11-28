import 'package:get/get.dart';
import 'routes.dart';
import '../app.dart';
import '../ui/screens/pengenalan_awal/onboarding/onboarding_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/pengenalan_awal/pilih_bahasa/pilih_bahasa_screen.dart';
import '../ui/screens/pengenalan_awal/welcome/welcome.dart';
import '../ui/screens/pengenalan_awal/intro/intro.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => const LaunchDecider()),
    GetPage(name: Routes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: Routes.pilih, page: () => const PilihBahasaScreen()),
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.welcome, page: () => const WelcomeScreen()),
    GetPage(name: Routes.intro, page: () => const IntroScreen()),

    // GetPage(name: Routes.register, page: () => const RegisterScreen()),
    // GetPage(name: Routes.login, page: () => const LoginScreen()),
    // GetPage(
    //   name: Routes.kenaldarimana,
    //   page: () => const KenalDarimanaScreen(),
    // ),
    // GetPage(name: Routes.mengapa, page: () => const MengapaScreen()),
    // GetPage(
    //   name: Routes.mulaihafalandarimana,
    //   page: () => const MulaiHafalanDariManaScreen(),
    // ),
  ];
}
