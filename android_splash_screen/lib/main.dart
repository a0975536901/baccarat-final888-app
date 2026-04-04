import 'package:flutter/material.dart';
import 'scanner.dart';
import 'analyzer.dart';
import 'learning.dart';
import 'overlay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "未開始";
  bool running = false;

  void start() {
    if (running) return;

    running = true;

    Scanner.start((data) {
      String r = Analyzer.analyze(data);

      // 紀錄學習
      Learning.record(data, r);

      setState(() {
        result = r;
      });
    });
  }

  void stop() {
    Scanner.stop();
    running = false;

    setState(() {
      result = "已停止";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI百家樂分析"),
      ),
      body: Stack(
        children: [
          /// 👉 主畫面
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result,
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: start,
                  child: Text("開始掃描"),
                ),
                ElevatedButton(
                  onPressed: stop,
                  child: Text("停止"),
                ),
              ],
            ),
          ),

          /// 👉 懸浮視窗（可拖動）
          OverlayWidget(result: result),
        ],
      ),
    );
  }
}
