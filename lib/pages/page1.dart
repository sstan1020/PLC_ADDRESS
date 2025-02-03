import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page1_controller.dart';
import './page2.dart';

class Page1 extends GetView<Page1Controller> {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Value: ${controller.value}',
                  style: const TextStyle(fontSize: 20),
                )),
            ElevatedButton(
              onPressed: () => Get.to(() => const Page2()),
              child: const Text('Go to Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
