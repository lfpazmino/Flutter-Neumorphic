import 'package:flutter/widgets.dart';

import '../container.dart';
import 'font_to_path.dart';
import 'text_path_provider.dart';

class NeumorphicText extends StatefulWidget {
  final String text;

  NeumorphicText(this.text);

  @override
  _NeumorphicTextState createState() => _NeumorphicTextState();
}

class _NeumorphicTextState extends State<NeumorphicText> {
  final fontToPath = NeumorphicFontToPath();
  List<Path> paths;

  @override
  void initState() {
    super.initState();
    _update();
  }

  @override
  void didUpdateWidget(NeumorphicText oldWidget) {
    super.didUpdateWidget(oldWidget);
    _update();
  }

  void _update() async {
    final List<Path> paths = await fontToPath.getPaths(font: "assets/sample_font.ttf", text: widget.text);
    setState(() {
      this.paths = paths;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (paths == null) {
      return Container();
    } else {
      return Row(
        children: paths.map((p) {
          return Neumorphic(
            boxShape: NeumorphicBoxShape.path(TextPathProvider(p)),
            style: NeumorphicStyle(
              intensity: 0.7,
              depth: -4.0,
            ),
            child: SizedBox(
              height: 200,
              width: 150,
            ),
          );
        }).toList(),
      );
    }
  }
}
