import 'package:get/get.dart';

class ValueController extends GetxController {
  // 使用 RxInt 来创建可观察的变量
  final _page1Value = 0.obs;
  final _page2Value = 0.obs;

  // getter 方法
  int get page1Value => _page1Value.value;
  int get page2Value => _page2Value.value;

  // 增加页面1的值
  void incrementPage1() {
    _page1Value.value++;
  }

  // 增加页面2的值
  void incrementPage2() {
    _page2Value.value++;
  }
}
