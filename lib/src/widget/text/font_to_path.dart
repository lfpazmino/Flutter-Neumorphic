import 'dart:ui';

import 'package:text_to_path_maker/text_to_path_maker.dart';

import 'font_provider.dart';

class NeumorphicFontToPath {

  PMFont myFont;

  void _load(String ttfName) async {
    myFont = await FontProvider.getOrCreate(ttfName);
  }

  Future<List<Path>> getPaths({String font, String text}) async {
    if (myFont == null) {
      _load(font);
    }
    final List<Path> paths = [];
    for (var i = 0; i < text.length; ++i) {
      //final charIndex = encoder.convert("f").first;
      final charIndex = text.codeUnitAt(i);
      final completePath = myFont.generatePathForCharacter(charIndex);
      paths.add(completePath);
    }
    return paths;
  }
}
