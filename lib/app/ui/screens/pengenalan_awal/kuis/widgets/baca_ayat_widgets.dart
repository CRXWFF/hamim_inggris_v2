import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/controllers/pemutaran_controller.dart';

class VerseArea extends StatelessWidget {
  final String text;
  final double height;
  const VerseArea({super.key, this.text = '', this.height = 260});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5EB),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(30),
            ),
            border: Border.all(color: const Color(0xFFFF9A66)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .1),
                blurRadius: 8,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(text, style: const TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}

class PlayControl extends StatelessWidget {
  final double size;
  const PlayControl({super.key, this.size = 76});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(PemutaranController());
    return GestureDetector(
      onTap: () {
        if (ctrl.isPlaying.value) {
          ctrl.pause();
        } else {
          ctrl.play();
        }
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFFFFB86B), Color(0xFFEB8A4D)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .12),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Obx(
          () => Icon(
            ctrl.isPlaying.value
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            color: Colors.white,
            size: size * 0.47,
          ),
        ),
      ),
    );
  }
}

class PutaranCard extends StatelessWidget {
  final double width;
  const PutaranCard({super.key, this.width = 200});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(PemutaranController());
    return Obx(() {
      final current = ctrl.current.value;
      return Container(
        height: 85,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEB9B71),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
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
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Text(
                    'DARI 5',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
