import 'package:flutter/material.dart';

//uuuuu
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      title: '简单计数器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('简单计数器示例222'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '你已经点击了这么多次:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: const Icon(Icons.add),
      ),
    );
=======
    return ListView(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        children: [
          const Divider(),
          const ListTile(
            title: Text('Item 1'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Item 2'),
            subtitle: const Text('Subtitle'),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1501196354995-cbb66c0ecc51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            isThreeLine: true,
            dense: true,
            contentPadding: const EdgeInsets.all(20),
            selected: true,
            selectedTileColor: Colors.blue,
            selectedColor: Colors.white,
            enabled: true,
            onLongPress: () {
              print('Long press');
            },
            onTap: () {
              print('Tap');
            },
          ),
          const Divider(),
          const ListTile(
            title: Text('Item 3'),
          ),
          const Divider(),
        ]);
>>>>>>> Stashed changes
  }
}
