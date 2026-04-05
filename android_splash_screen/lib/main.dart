import 'package:flutter/material.dart';
import 'dart:async';

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
  Timer? timer;

  void start() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      List<String> data = ["莊", "閒", "莊", "莊", "閒"];
      data.shuffle();

      int b = data.where((e) => e == "莊").length;
      int p = data.where((e) => e == "閒").length;

      String r;
      if (b > p) r = "建議：莊";
      else if (p > b) r = "建議：閒";
      else r = "觀望";

      setState(() {
        result = r;
      });
    });
  }

  void stop() {
    timer?.cancel();
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(result, style: TextStyle(fontSize: 28)),
                ElevatedButton(onPressed: start, child: Text("開始")),
                ElevatedButton(onPressed: stop, child: Text("停止")),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.black54,
              child: Text(
                result,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
