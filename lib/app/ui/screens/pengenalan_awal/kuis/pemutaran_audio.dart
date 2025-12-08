import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/controllers/pemutaran_controller.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/kuis/widgets/mascot_bubble.dart';

class PemutaranAudioScreen extends StatelessWidget {
  const PemutaranAudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PengenalanController? pCtrl;
    try {
      pCtrl = Get.find<PengenalanController>();
    } catch (_) {
      pCtrl = null;
    }
    final total = pCtrl != null ? pCtrl.audioRepeats.value : 1;
    final ctrl = Get.put(PemutaranController());

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top status bar shows overall progress (current repeat / total)
              Obx(() {
                // Show overall progress in terms of quiz types.
                // There are 5 quiz types total; the audio quiz spans 2 parts.
                const int totalQuizTypes = 5;
                final frac = (ctrl.completedParts.value) / totalQuizTypes;
                return StatusBar(
                  progress: frac.clamp(0.0, 1.0),
                  onBack: () => Get.back(),
                );
              }),

              const SizedBox(height: 20),

              // mascot + bubble (header)
              MascotBubble(text: 'Dengarkan audionya\nbaik-baik'),

              const SizedBox(height: 100),

              // big card showing PUTARAN X / DARI N
              Obx(() {
                final current = ctrl.current.value;
                return Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEB9B71),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      // vinyl icon placeholder
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white24,
                        ),
                        child: const Icon(
                          Icons.album,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PUTARAN $current',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Text(
                              'DARI $total',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 40),

              // play / pause control
              Center(
                child: Obx(() {
                  final playing = ctrl.isPlaying.value;
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (playing) {
                            ctrl.pause();
                          } else {
                            ctrl.play();
                          }
                        },
                        child: Container(
                          width: 92,
                          height: 92,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFFFB86B),
                                const Color(0xFFEB8A4D),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .12),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            playing
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 44,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => Text(
                          '${(ctrl.progress.value * 100).round()}%',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  );
                }),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: SelanjutnyaButton(
                    onPressed: () {
                      // if playback completed all repeats then proceed; otherwise proceed to next repeat
                      if (ctrl.current.value >= total &&
                          !ctrl.isPlaying.value) {
                        Get.offAllNamed('/home');
                      } else if (!ctrl.isPlaying.value) {
                        // user can advance to next repeat manually
                        ctrl.next();
                      }
                    },
                    height: 56,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
