import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/routes/routes.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/cards/card_pilihan.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import '../../../components/widgets/speech_bubble.dart';
import 'widgets/mascot_bahasa.dart';

class PilihBahasaScreen extends StatefulWidget {
  const PilihBahasaScreen({super.key});

  @override
  State<PilihBahasaScreen> createState() => _PilihBahasaScreenState();
}

class _PilihBahasaScreenState extends State<PilihBahasaScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 90),

              // Speech bubble
              const Center(child: SpeechBubble()),

              const SizedBox(height: 18),

              // mascot image
              const Center(child: MascotBahasa(size: 200)),

              const SizedBox(height: 18),

              // Pilihan Bahasa
              CardPilihan(
                label: 'Indonesia',
                icon: Icons.flag_circle,
                selected: _selectedIndex == 0,
                onTap: () => setState(() => _selectedIndex = 0),
              ),
              const SizedBox(height: 12),
              CardPilihan(
                label: 'Arabic',
                icon: Icons.flag_circle,
                selected: _selectedIndex == 1,
                onTap: () => setState(() => _selectedIndex = 1),
              ),
              const SizedBox(height: 12),
              CardPilihan(
                label: 'English',
                icon: Icons.flag_circle,
                selected: _selectedIndex == 2,
                onTap: () => setState(() => _selectedIndex = 2),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: SelanjutnyaButton(
                  onPressed: () => Get.toNamed(Routes.welcome),
                  height: 56,
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
