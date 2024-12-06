import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  final int initialValue;

  const InputPage({super.key, required this.initialValue});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _processInput() {
    int? value = int.tryParse(_controller.text);
    if (value != null) {
      Navigator.pop(context, value);
    } else {
      setState(() {
        _result = '请输入有效的数字';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('输入页面'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: '请输入内容',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processInput,
              child: const Text('提交'),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 18)),
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
