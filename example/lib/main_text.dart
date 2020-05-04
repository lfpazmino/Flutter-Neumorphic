import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: NeumorphicColors.background,
      body: Container(
        child: Column(children: [NeumorphicText("wesh", ttf: "assets/sample_font.ttf",)]),
        padding: EdgeInsets.all(16),
      ),
      appBar: AppBar(title: Text("Example")),
    ));
  }
}
