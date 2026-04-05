import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baccarat AI',
      home: Scaffold(
        appBar: AppBar(title: const Text('Baccarat AI')),
        body: const Center(
          child: Text(
            'App 啟動成功',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
