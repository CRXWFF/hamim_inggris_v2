import 'dart:async';

import 'package:get/get.dart';

/// Controller to manage loading/progress logic for the Bersiaplah screen.
class BersiaplahController extends GetxController {
  final RxDouble progress = 0.0.obs;
  final RxBool loadingDone = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startLoading();
  }

  void startLoading({
    int totalTicks = 100,
    Duration tickDuration = const Duration(milliseconds: 30),
  }) {
    int tick = 0;
    loadingDone.value = false;
    progress.value = 0.0;
    _timer?.cancel();
    _timer = Timer.periodic(tickDuration, (t) {
      tick++;
      progress.value = (tick / totalTicks).clamp(0.0, 1.0);
      if (tick >= totalTicks) {
        t.cancel();
        loadingDone.value = true;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
