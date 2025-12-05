import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/routes/routes.dart';

/// Controller that holds onboarding selections and the paging logic.
class PengenalanController extends GetxController {
  // where did you learn about HAMIM
  final RxString kenalDarimana = ''.obs;

  // why do you want to memorize
  final RxString mengapa = ''.obs;
  // where to start memorizing (e.g., 'Juz 1' or 'Juz 30')
  final RxString mulaiDari = ''.obs;

  // page controller & index for the in-place slider
  final PageController pageController = PageController();
  final RxInt pageIndex = 0.obs;

  void setKenalDarimana(String value) => kenalDarimana.value = value;
  void setMengapa(String value) => mengapa.value = value;
  void setMulaiDari(String value) => mulaiDari.value = value;

  void setPageIndex(int i) => pageIndex.value = i;

  /// Advance to next page (handles validation and final submission)
  void goNext() {
    final idx = pageIndex.value;
    // validation messages use Get.snackbar so we don't need a BuildContext
    if (idx == 0) {
      if (mulaiDari.value.isEmpty) {
        Get.snackbar(
          '',
          'Pilih salah satu opsi',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        return;
      }
      pageController.nextPage(
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeInOut,
      );
      return;
    }

    if (idx == 1) {
      if (kenalDarimana.value.isEmpty) {
        Get.snackbar(
          '',
          'Pilih salah satu opsi',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        return;
      }
      pageController.nextPage(
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeInOut,
      );
      return;
    }

    // last step
    if (idx >= 2) {
      if (mengapa.value.isEmpty) {
        Get.snackbar(
          '',
          'Pilih salah satu opsi',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        return;
      }
      saveProgress();
      Get.offAllNamed(Routes.home);
    }
  }

  /// Go back one page or pop / fallback to home
  void goBack() {
    final idx = pageIndex.value;
    if (idx > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    final ctx = Get.context;
    if (ctx != null && Navigator.of(ctx).canPop()) {
      Navigator.of(ctx).maybePop();
    } else {
      Get.offAllNamed(Routes.home);
    }
  }

  /// Prepare a payload that can later be sent to backend
  Map<String, dynamic> toJson() {
    return {
      'mulai_dari': mulaiDari.value,
      'kenal_darimana': kenalDarimana.value,
      'mengapa': mengapa.value,
    };
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

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
