import 'dart:async';

import 'package:get/get.dart';

/// Controller for the pemutaran (playback) screen.
class PemutaranController extends GetxController {
  final RxInt current = 1.obs; // current repeat index (1-based)
  final RxBool isPlaying = false.obs;
  final RxDouble progress = 0.0.obs; // 0.0 - 1.0 for current repeat
  final RxInt completedParts =
      0.obs; // how many quiz parts completed (audio spans 2 parts)

  Timer? _timer;

  /// Start playback simulation for the current repeat.
  void play({Duration duration = const Duration(seconds: 3)}) {
    if (isPlaying.value) return;
    isPlaying.value = true;
    progress.value = 0.0;
    int ticks = 0;
    final totalTicks = (duration.inMilliseconds / 100).round();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      ticks++;
      progress.value = (ticks / totalTicks).clamp(0.0, 1.0);
      if (ticks >= totalTicks) {
        t.cancel();
        isPlaying.value = false;
        progress.value = 1.0;
        // mark one completed part (cap at 2 for audio)
        if (completedParts.value < 2) completedParts.value++;
      }
    });
  }

  void pause() {
    _timer?.cancel();
    isPlaying.value = false;
  }

  void stop() {
    pause();
    progress.value = 0.0;
  }

  void next() {
    current.value++;
    progress.value = 0.0;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
