import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/controllers/kuis_ayat_controller.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/kuis/widgets/mascot_bubble.dart';
import 'widgets/baca_ayat_widgets.dart';

class KuisScreen extends StatelessWidget {
  const KuisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(KuisAyatController());

    // initialize placeholder options if empty
    if (ctrl.options.isEmpty || ctrl.options.every((s) => s.isEmpty)) {
      ctrl.setOptions(['Pilihan A', 'Pilihan B', 'Pilihan C', 'Pilihan D']);
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const StatusBar(progress: 0.2, onBack: null),
              const SizedBox(height: 12),

              const MascotBubble(text: 'Isi ayat bagian\nyang kosongnya ya'),
              const SizedBox(height: 12),

              // small badge 1/5
              Container(
                margin: const EdgeInsets.only(left: 0, bottom: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9A66),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '1/5',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // verse area
              const VerseArea(),

              const SizedBox(height: 18),

              // options grid
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 3.2,
                      shrinkWrap: true,
                      children: List.generate(4, (i) {
                        return Obx(() {
                          final selected = ctrl.selected.value == i;
                          return GestureDetector(
                            onTap: () => ctrl.select(i),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF5EB),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: selected
                                      ? const Color(0xFFEB8A4D)
                                      : const Color(0xFFF3B99A),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: .04),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                ctrl.options[i],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        });
                      }),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: SelanjutnyaButton(
                    onPressed: () {
                      // after quiz, navigate to sambung ayat
                      Get.toNamed('/sambung-ayat');
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
