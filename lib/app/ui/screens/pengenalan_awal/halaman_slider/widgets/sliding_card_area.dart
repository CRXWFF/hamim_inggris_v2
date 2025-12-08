import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/ui/components/cards/card_pilihan.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/intro/widgets/speech_bubble.dart';
import 'package:hamim_inggris_v2/app/ui/screens/pengenalan_awal/intro/widgets/mascot_siap.dart';

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

  static final List<Map<String, String>> _targetOptions = [
    {'label': '5 menit / hari', 'meta': 'Mulai dulu'},
    {'label': '15 menit / hari', 'meta': 'Siap konsisten'},
    {'label': '20 menit / hari', 'meta': 'Yang terbaik'},
    {'label': '30 menit / hari', 'meta': 'Mau serius'},
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

          // page 3 - daily target selection
          Obx(() {
            final selected = ctrl.target.value;
            return SingleChildScrollView(
              child: Column(
                children: _targetOptions.map((opt) {
                  final label = opt['label']!;
                  final meta = opt['meta']!;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CardPilihan(
                      label: label,
                      meta: meta,
                      icon: Icons.timer,
                      selected: selected == label,
                      onTap: () => ctrl.setTarget(label),
                    ),
                  );
                }).toList(),
              ),
            );
          }),

          // page 4 - centered mascot + bubble (confirmation/readiness)
          Obx(() {
            final count = ctrl.pendingCount.value;
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpeechBubble(
                    text:
                        'Itu menandakan di\nminggu ini kamu akan hafal $count ayat',
                  ),
                  const SizedBox(height: 12),
                  MascotSiap(size: 300),
                ],
              ),
            );
          }),

          // page 5 - results summary (yang didapat)
          Obx(() {
            final items = [
              'Hafal ${ctrl.pendingCount.value} ayat',
              'Hafal 1 Juz',
              'Membuat kebiasaan baru dalam menghafal',
            ];

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  // card with top pill
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.fromLTRB(20, 36, 20, 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF7F0),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: const Color(0xFFEBA77F)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: items.asMap().entries.map((e) {
                            final idx = e.key + 1;
                            final text = e.value;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        236,
                                        148,
                                        89,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$idx.',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(child: Text(text)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      // top pill
                      Positioned(
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 148, 89),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            'Yang kamu dapatkan:',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          }),

          // page 6 - another centered mascot + bubble (use GIF asset)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpeechBubble(
                  text: 'Bersiaplah, untuk\nmencoba hafalan\npertamamu',
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    'assets/gif/maskot_bersiaplah.gif',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          // page 7 - another centered mascot + bubble (use GIF asset)
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpeechBubble(
                  text:
                      'Sebelum mulai,\naku akan putarkan\naudio hafalannya\nterlebih dahulu, tanpa\nada text ayat nya',
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    'assets/gif/maskot_loading_sebelum_kuis.gif',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
