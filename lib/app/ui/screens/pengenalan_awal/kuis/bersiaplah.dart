import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/controllers/bersiaplah_controller.dart';
import '../../../components/widgets/speech_bubble.dart';

/// UI-only screen. All loading logic lives in [BersiaplahController].
class BersiaplahScreen extends StatelessWidget {
  const BersiaplahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.isRegistered<BersiaplahController>()
        ? Get.find<BersiaplahController>()
        : Get.put(BersiaplahController());
    // try to find the onboarding controller (optional)
    PengenalanController? pCtrl;
    try {
      pCtrl = Get.find<PengenalanController>();
    } catch (_) {
      pCtrl = null;
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusBar(progress: 1, onBack: () => Get.back()),
              const SizedBox(height: 100),

              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpeechBubble(
                      text: 'BERSIAPLAH',
                      textStyle: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Image.asset(
                      'assets/gif/maskot_bersiaplah.gif',
                      width: 260,
                      height: 260,
                    ),
                    const SizedBox(height: 18),
                    if (pCtrl != null)
                      Obx(
                        () => Text(
                          'Menyiapkan audio x${pCtrl!.audioRepeats.value} putaran',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                  ],
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => SelanjutnyaButton(
                      onPressed: ctrl.loadingDone.value
                          ? () {
                              // proceed to pemutaran audio screen
                              Get.toNamed('/pemutaran-audio');
                            }
                          : null,
                      height: 56,
                    ),
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
