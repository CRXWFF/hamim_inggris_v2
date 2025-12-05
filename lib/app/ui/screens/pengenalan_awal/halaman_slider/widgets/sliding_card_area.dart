import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/ui/components/cards/card_pilihan.dart';

/// SlidingCardArea contains the PageView for the three onboarding steps.
class SlidingCardArea extends StatelessWidget {
  final PengenalanController ctrl;

  const SlidingCardArea({super.key, required this.ctrl});

  static final List<Map<String, dynamic>> _juzOptions = [
    {'label': 'Dari Awal (Juz 1)', 'value': 'juz_1'},
    {'label': 'Dari Akhir (Juz 30)', 'value': 'juz_30'},
  ];

  static final List<Map<String, dynamic>> _kenalOptions = [
    {'label': 'Facebook', 'icon': Icons.facebook},
    {'label': 'Instagram', 'icon': Icons.camera_alt},
    {'label': 'Playstore', 'icon': Icons.shop},
    {'label': 'Tiktok', 'icon': Icons.music_note},
    {'label': 'Teman / Keluarga', 'icon': Icons.group},
    {'label': 'Lainnya', 'icon': Icons.more_horiz},
  ];

  static final List<String> _mengapaOptions = [
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
    return Expanded(
      child: PageView(
        controller: ctrl.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (i) => ctrl.setPageIndex(i),
        children: [
          // page 0 - pilih juz
          Obx(() {
            final selected = ctrl.mulaiDari.value;
            return SingleChildScrollView(
              child: Column(
                children: _juzOptions.map((opt) {
                  final label = opt['label'] as String;
                  final value = opt['value'] as String;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CardPilihan(
                      label: label,
                      icon: Icons.book,
                      selected: selected == value,
                      onTap: () => ctrl.setMulaiDari(value),
                    ),
                  );
                }).toList(),
              ),
            );
          }),

          // page 1 - kenal darimana
          Obx(() {
            final selected = ctrl.kenalDarimana.value;
            return SingleChildScrollView(
              child: Column(
                children: _kenalOptions.map((opt) {
                  final label = opt['label'] as String;
                  final icon = opt['icon'] as IconData;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CardPilihan(
                      label: label,
                      icon: icon,
                      selected: selected == label,
                      onTap: () => ctrl.setKenalDarimana(label),
                    ),
                  );
                }).toList(),
              ),
            );
          }),

          // page 2 - mengapa
          Obx(() {
            final selected = ctrl.mengapa.value;
            return SingleChildScrollView(
              child: Column(
                children: _mengapaOptions.map((label) {
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
        ],
      ),
    );
  }
}
