import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamim_inggris_v2/app/controllers/kuis_controller.dart';

class CounterControls extends StatelessWidget {
  const CounterControls({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(KuisController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => IconButton(
            onPressed: ctrl.repeats.value > KuisController.minRepeats
                ? ctrl.decrement
                : null,
            icon: const Icon(Icons.remove_circle_rounded),
            color: Colors.lightBlue,
            iconSize: 36,
          ),
        ),

        SizedBox(
          width: 140,
          child: Obx(
            () => Container(
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
              ),
              child: Text(
                '${ctrl.repeats.value}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),

        Obx(
          () => IconButton(
            onPressed: ctrl.repeats.value < KuisController.maxRepeats
                ? ctrl.increment
                : null,
            icon: const Icon(Icons.add_circle_rounded),
            color: Colors.lightBlue,
            iconSize: 36,
          ),
        ),
      ],
    );
  }
}
