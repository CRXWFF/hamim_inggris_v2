import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/routes/routes.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/back_button.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/intro/widgets/speech_bubble.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/intro/widgets/mascot_intro.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/intro/widgets/mascot_siap.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/intro/widgets/intro_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  void _next() {
    if (_page < 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(Routes.welcome);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (i) => setState(() => _page = i),
              children: [
                IntroPage(
                  bubble: SpeechBubble(
                    text: '',
                    textSpan: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(text: 'Halo Aku '),
                        TextSpan(
                          text: 'HAMIM',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  mascot: MascotIntro(size: 300),
                ),
                IntroPage(
                  bubble: SpeechBubble(
                    text: 'Siap ya ada 4 pertanyaan dulu\nsebelum dimulai',
                  ),
                  mascot: MascotSiap(size: 300),
                ),
              ],
            ),

            // top-left back button
            Positioned(
              left: 20,
              top: 16,
              child: AppBackButton(
                onPressed: () {
                  if (_page > 0) {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 260),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Get.back();
                  }
                },
                size: 44,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: SizedBox(
            height: 56,
            child: SelanjutnyaButton(onPressed: _next, height: 56),
          ),
        ),
      ),
    );
  }
}
