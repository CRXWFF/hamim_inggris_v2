import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/controllers/pemutaran_controller.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/kuis/widgets/mascot_bubble.dart';
import 'widgets/baca_ayat_widgets.dart';

class BacaAyatScreen extends StatelessWidget {
  const BacaAyatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // try to reuse controllers if available
    final ctrl = Get.put(PemutaranController());
    final totalQuizTypes = 5;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => StatusBar(
                  progress: (ctrl.completedParts.value) / totalQuizTypes,
                  onBack: () => Get.back(),
                ),
              ),
              const SizedBox(height: 20),

              MascotBubble(text: 'Dengarkan sambil\nbaca ayatnya'),

              const SizedBox(height: 50),

              // verse area widget
              const VerseArea(),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  PlayControl(),
                  SizedBox(width: 24),
                  PutaranCard(),
                ],
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: SelanjutnyaButton(
                    onPressed: () => Get.offAllNamed('/kuis'),
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
