import 'package:get/get.dart';

class KuisAyatController extends GetxController {
  final RxInt selected = RxInt(-1);

  // placeholder options; in real app these would come from data
  final RxList<String> options = <String>['', '', '', ''].obs;

  void select(int idx) {
    selected.value = idx;
  }

  void setOptions(List<String> items) {
    options.value = items;
    selected.value = -1;
  }
}
