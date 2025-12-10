import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/speech_bubble.dart';
import 'widgets/counter_controls.dart';
import 'package:hamim_inggris_v2/app/controllers/kuis_controller.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/routes/routes.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';

class BerapaAudioScreen extends StatelessWidget {
  const BerapaAudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusBar(progress: 0.9),
              const SizedBox(height: 50),

              // bubble + mascot
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpeechBubble(
                      text: 'Kamu mau aku\nputarkan berapa\nputaran audionya?',
                    ),
                    // const SizedBox(height: 50),
                    Image.asset(
                      'assets/gif/maskot_kuis.gif',
                      width: 300,
                      height: 300,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // counter controls
              const CounterControls(),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: SelanjutnyaButton(
                    onPressed: () {
                      // Save repeats into onboarding controller then go to loading screen
                      try {
                        final kCtrl = Get.find<KuisController>();
                        final pCtrl = Get.find<PengenalanController>();
                        pCtrl.setAudioRepeats(kCtrl.repeats.value);
                      } catch (_) {
                        // ignore if controllers not found
                      }
                      Get.toNamed(Routes.bersiaplah);
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
