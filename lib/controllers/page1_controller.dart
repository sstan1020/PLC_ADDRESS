import 'package:get/get.dart';

class Page1Controller extends GetxController {
  final _value = 0.obs;
  int get value => _value.value;
  void increment() => _value.value++;
}
