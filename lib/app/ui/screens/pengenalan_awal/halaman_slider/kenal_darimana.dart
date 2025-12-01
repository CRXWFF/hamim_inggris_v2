import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/core/constants/color.dart';
import 'package:hamim_inggris_v2/app/ui/components/cards/card_pilihan.dart';
import 'package:hamim_inggris_v2/app/ui/components/buttons/selanjutnya_button.dart';
import 'package:hamim_inggris_v2/app/controllers/pengenalan_controller.dart';
import 'package:hamim_inggris_v2/app/ui/components/widgets/status_bar.dart';

/// Combined two-step onboarding widget. Only the card area (middle) slides from right-to-left when pressing `Selanjutnya`. The status bar, header and bottom button remain static.
class KenalDarimanaScreen extends StatefulWidget {
  const KenalDarimanaScreen({super.key});

  @override
  State<KenalDarimanaScreen> createState() => _KenalDarimanaScreenState();
}

class _KenalDarimanaScreenState extends State<KenalDarimanaScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goNext(PengenalanController ctrl) {
    if (_pageIndex == 0) {
      // require a selection before proceeding
      if (ctrl.kenalDarimana.value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pilih satu opsi terlebih dahulu')),
        );
        return;
      }
      _pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeInOut,
      );
    } else {
      // last step: ensure selection then finish
      if (ctrl.mengapa.value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pilih satu opsi terlebih dahulu')),
        );
        return;
      }
      ctrl.saveProgress();
      Get.offAllNamed('/home');
    }
  }

  void _goBack(BuildContext context) {
    if (_pageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeInOut,
      );
    } else {
      final ctx = Get.context;
      if (ctx != null && Navigator.of(ctx).canPop()) {
        Navigator.of(ctx).maybePop();
      } else {
        Get.offAllNamed('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(PengenalanController());

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // status bar + back button (static)
              StatusBar(
                progress: _pageIndex == 0 ? 0.25 : 0.55,
                onBack: () => _goBack(context),
              ),

              const SizedBox(height: 12),

              // header (static)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text(
                        _pageIndex == 0
                            ? 'Darimana kamu tau HAMIM?'
                            : 'Mengapa kamu\ningin hafal Qur\'an?',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // sliding area: only this PageView will animate
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (idx) => setState(() => _pageIndex = idx),
                  children: [
                    // page 0: kenal darimana
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

                    // page 1: mengapa
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
              ),

              // bottom button (static)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: SelanjutnyaButton(
                    onPressed: () => _goNext(ctrl),
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
