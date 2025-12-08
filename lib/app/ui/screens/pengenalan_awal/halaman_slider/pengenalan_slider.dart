import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/halaman_slider/widgets/mascot_bubble.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/halaman_slider/widgets/sliding_card_area.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/halaman_slider/widgets/result_header.dart';

class PengenalanSliderScreen extends StatefulWidget {
  const PengenalanSliderScreen({super.key});

  @override
  State<PengenalanSliderScreen> createState() => _PengenalanSliderScreenState();
}

class _PengenalanSliderScreenState extends State<PengenalanSliderScreen> {
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
            // determine which pages show top bubble/header; keep centered pages handled in SlidingCardArea
            String bubbleText;
            double progress;
            switch (page) {
              case 0:
                bubbleText = 'Kamu ingin memulai\nhafalan dari mana?';
                progress = 0.1;
                break;
              case 1:
                bubbleText = 'Darimana kamu tau HAMIM?';
                progress = 0.2;
                break;
              case 2:
                bubbleText = 'Mengapa kamu\ningin hafal Qur\'an?';
                progress = 0.3;
                break;
              case 3:
                bubbleText =
                    'Berapa lama target harianmu yang akan\nkamu luangkan?';
                progress = 0.4;
                break;
              case 4:
                bubbleText =
                    'Itu menandakan di\nminggu ini kamu akan hafal ${ctrl.pendingCount.value} ayat';
                progress = 0.5;
                break;
              case 5:
                bubbleText =
                    'Dalam 3 bulan kedepan\nini yang akan kamu dapatkan';
                progress = 0.6;
                break;
              case 6:
                bubbleText = 'Bersiaplah, untuk mencoba hafalan pertamamu';
                progress = 0.7;
                break;
              default:
                bubbleText =
                    'Sebelum mulai,\naku akan putarkan audio hafalannya terlebih dahulu, tanpa ada text ayat nya';
                progress = 0.8;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // static status bar + back (always visible)
                StatusBar(progress: progress, onBack: () => ctrl.goBack()),

                const SizedBox(height: 18),

                // show mascot + bubble only on the main question pages (0-3)
                if (page >= 0 && page <= 3) ...[
                  MascotBubble(text: bubbleText),

                  SizedBox(height: page == 0 ? 70 : 18),
                ] else if (page == 5) ...[
                  // special header for the results summary page
                  ResultHeader(text: bubbleText),
                  const SizedBox(height: 18),
                ],

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
