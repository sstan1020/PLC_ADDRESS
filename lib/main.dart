import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '简单 Flutter 应用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '计数器示例'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _selectedItem = 'Option 1';

  void _goToInputPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputPage(initialValue: _counter),
      ),
    );

    print('返回结果: $result');
    if (result != null) {
      setState(() {
        _counter = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('主页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('当前数值: $_counter'),
            const SizedBox(height: 20), // 添加一些间距
            DropdownButton<String>(
              value: _selectedItem,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                }
              },
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20), // 再添加一些间距
            Text('选中的选项: $_selectedItem'), // 显示选中的选项
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToInputPage,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
