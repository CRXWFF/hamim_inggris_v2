import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/kuis/widgets/mascot_bubble.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';

class SpeechToTextScreen extends StatelessWidget {
  const SpeechToTextScreen({super.key});

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
              const SizedBox(height: 8),
              const StatusBar(progress: 0.5, onBack: null),
              const SizedBox(height: 20),

              // make main content scrollable so footer button never overflows
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MascotBubble(
                        text:
                            'Sekarang giliran\nkamu setor ke aku\nnanti aku cek',
                      ),

                      const SizedBox(height: 40),

                      // centered verse area
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 520),
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF5EB),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                              ),
                              border: Border.all(
                                color: const Color(0xFFFF9A66),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: .1),
                                  blurRadius: 6,
                                  offset: const Offset(10, 10),
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
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
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

                      const SizedBox(height: 25),

                      // big circular mic button
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 96,
                              height: 96,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFFFB86B),
                                    Color(0xFFEB8A4D),
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
                              child: const Icon(
                                Icons.mic,
                                color: Colors.white,
                                size: 44,
                              ),
                            ),
                            // const SizedBox(height: 12),
                            const Text(
                              'Tap untuk merekam',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: SelanjutnyaButton(
                    onPressed: () {
                      // go to quiz result screen
                      Get.toNamed('/result-kuis');
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
