import 'package:get/get.dart';

class DetailController extends GetxController {
  var receivedCount = 0.obs;
  var detailCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // 获取从首页传递的参数并设置到 receivedCount
    int? args = Get.arguments;
    if (args != null) {
      receivedCount.value = args;
    }
  }

  void incrementDetail() {
    detailCount.value++;
  }
}
