import 'package:get/get.dart';

/// Simple controller to hold selections during the onboarding flow.
class PengenalanController extends GetxController {
  // where did you learn about HAMIM
  final RxString kenalDarimana = ''.obs;

  // why do you want to memorize
  final RxString mengapa = ''.obs;

  void setKenalDarimana(String value) {
    kenalDarimana.value = value;
  }

  void setMengapa(String value) {
    mengapa.value = value;
  }

  /// Prepare a payload that can later be sent to backend
  Map<String, dynamic> toJson() {
    return {'kenal_darimana': kenalDarimana.value, 'mengapa': mengapa.value};
  }

  /// Temporary hook where you might persist locally or send to backend.
  /// Right now it just prints for debugging.
  void saveProgress() {
    // TODO: replace with SharedPreferences/GetStorage or actual API call
    // when backend is available.
    // Example: await api.post('/onboarding', body: toJson());
    // For now just log.
    // ignore: avoid_print
    print('Pengenalan progress saved: ${toJson()}');
  }
}
