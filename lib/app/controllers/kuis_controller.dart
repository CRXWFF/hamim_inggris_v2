import 'package:get/get.dart';

class KuisController extends GetxController {
  final RxInt repeats = 1.obs;

  static const int minRepeats = 1;
  static const int maxRepeats = 10;

  void increment() {
    if (repeats.value < maxRepeats) repeats.value++;
  }

  void decrement() {
    if (repeats.value > minRepeats) repeats.value--;
  }
}
