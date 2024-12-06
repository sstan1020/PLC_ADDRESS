import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  final int initialValue;

  const InputPage({super.key, required this.initialValue});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // 使用传入的初始值设置文本框
    _controller = TextEditingController(text: widget.initialValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('输入页面')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: '请输入数字'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 将输入转换为数字并返回
                  int? value = int.tryParse(_controller.text);
                  if (value != null) {
                    Navigator.pop(context, value);
                  }
                },
                child: const Text('确定'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
