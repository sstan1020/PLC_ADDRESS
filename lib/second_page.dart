import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic> ?? {};
    final String message = arguments['message'] ?? 'No message';
    final int count = arguments['count'] ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received message: $message'),
            Text('Received count: $count'),
            ElevatedButton(
              onPressed: () {
                Get.back(result: 'Hello from Second Page');
              },
              child: Text('Back to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
