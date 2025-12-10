import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/kuis/widgets/mascot_bubble.dart';
import '';

class SambungAyatScreen extends StatelessWidget {
  const SambungAyatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For now we show static UI per mock
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const StatusBar(progress: 0.4, onBack: null),
              const SizedBox(height: 20),

              const MascotBubble(text: 'Kita mulai\nsambung ayat'),
              const SizedBox(height: 50),

              // large sheet with lines
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF5EB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                      ),
                      border: Border.all(color: const Color(0xFFFF9A66)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .04),
                          blurRadius: 6,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          6,
                          (i) => const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              color: Color(0xFFFF9A66),
                              thickness: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Center(
                child: SizedBox(
                  width: 180,
                  child: SelanjutnyaButton(
                    label: 'MULAI',
                    height: 64,
                    onPressed: () {
                      // navigate to speech-to-text recording screen
                      Get.toNamed('/speech-to-text');
                    },
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
