import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page2_controller.dart';

class Page2 extends GetView<Page2Controller> {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Value: ${controller.value}',
                  style: const TextStyle(fontSize: 20),
                )),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
