import 'package:get/get.dart';
import 'routes.dart';
import '../app.dart';
import '../ui/screens/pengenalan_awal/onboarding/onboarding_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/pengenalan_awal/pilih_bahasa/pilih_bahasa_screen.dart';
import '../ui/screens/pengenalan_awal/welcome/welcome.dart';
import '../ui/screens/pengenalan_awal/intro/intro.dart';
import '../ui/screens/pengenalan_awal/halaman_slider/pengenalan_slider.dart';
import '../ui/screens/pengenalan_awal/kuis/kuis.dart';
import 'package:hamim_inggris_v2/app/ui/screens/auth/login/login.dart';
import '../ui/screens/pengenalan_awal/kuis/bersiaplah.dart';
import '../ui/screens/pengenalan_awal/kuis/pemutaran_audio.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => const LaunchDecider()),
    GetPage(name: Routes.onboarding, page: () => const OnboardingScreen()),
    GetPage(name: Routes.pilih, page: () => const PilihBahasaScreen()),
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.welcome, page: () => const WelcomeScreen()),
    GetPage(name: Routes.intro, page: () => const IntroScreen()),
    GetPage(
      name: Routes.mulaihafalandarimana,
      page: () => const PengenalanSliderScreen(),
    ),

    GetPage(name: Routes.kuis, page: () => const KuisScreen()),
    GetPage(name: Routes.bersiaplah, page: () => const BersiaplahScreen()),
    GetPage(name: Routes.pemutaran, page: () => const PemutaranAudioScreen()),

    // GetPage(name: Routes.register, page: () => const RegisterScreen()),
    GetPage(name: Routes.login, page: () => const LoginScreen()),
  ];
}
