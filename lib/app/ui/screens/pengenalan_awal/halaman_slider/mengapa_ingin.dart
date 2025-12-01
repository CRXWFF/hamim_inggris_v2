import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/cards/card_pilihan.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';

class MengapaScreen extends StatelessWidget {
  const MengapaScreen({super.key});

  static final List<String> options = [
    'Untuk menjadi imam',
    'Mengisi waktu pensiun',
    'Kualitas ibadah',
    'Untuk studi/pendidikan',
    'Memberi teladan bagi keluarga',
    'Sebagai bekal dakwah',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<PengenalanController>();

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // progress bar
              const StatusBar(progress: 0.5),

              const SizedBox(height: 18),
              Row(
                children: [
                  SizedBox(
                    width: 72,
                    height: 72,
                    child: Image.asset(
                      'assets/gif/maskot_header.gif',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFFF9A66)),
                      ),
                      child: const Text(
                        'Mengapa kamu\ningin hafal Qur\'an?',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Expanded(
                child: Obx(() {
                  final selected = ctrl.mengapa.value;
                  return SingleChildScrollView(
                    child: Column(
                      children: options.map((label) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CardPilihan(
                            label: label,
                            icon: Icons.circle,
                            selected: selected == label,
                            onTap: () => ctrl.setMengapa(label),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SelanjutnyaButton(
                  onPressed: () {
                    final ctrl = Get.find<PengenalanController>();
                    ctrl.saveProgress();
                    // finish onboarding or navigate further
                    Get.offAllNamed('/home');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
