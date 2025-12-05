import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/halaman_slider/widgets/mascot_bubble.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/halaman_slider/widgets/sliding_card_area.dart';

class PengenalanSliderScreen extends StatefulWidget {
  const PengenalanSliderScreen({super.key});

  @override
  State<PengenalanSliderScreen> createState() => _PengenalanSliderScreenState();
}

class _PengenalanSliderScreenState extends State<PengenalanSliderScreen> {
  // Page state moved to controller

  @override
  void dispose() {
    // controller disposes PageController in its onClose; nothing to do here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(PengenalanController());

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() {
            final page = ctrl.pageIndex.value;
            String bubbleText;
            double progress;
            switch (page) {
              case 0:
                bubbleText = 'Kamu ingin memulai\nhafalan dari mana?';
                progress = 0.25;
                break;
              case 1:
                bubbleText = 'Darimana kamu tau HAMIM?';
                progress = 0.5;
                break;
              default:
                bubbleText = 'Mengapa kamu\ningin hafal Qur\'an?';
                progress = 0.75;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // static status bar + back
                StatusBar(progress: progress, onBack: () => ctrl.goBack()),

                const SizedBox(height: 18),

                // static mascot + bubble (text changes per page)
                MascotBubble(text: bubbleText),

                SizedBox(height: page == 0 ? 70 : 18),

                // sliding card area only
                SlidingCardArea(ctrl: ctrl),

                // static bottom button
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: SelanjutnyaButton(
                      onPressed: () => ctrl.goNext(),
                      height: 56,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
