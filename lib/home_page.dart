import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // 传递多个参数到 SecondPage
            final result = await Get.toNamed(
              '/second',
              arguments: {
                'message': 'Hello from Home Page',
                'count': 42,
              },
            );
            // 显示返回的结果
            if (result != null) {
              Get.snackbar('Returned Value', result);
            }
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}
