import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:text_to_path_maker/text_to_path_maker.dart';

class NeumorphicFontToPath {

  static final reader = PMFontReader();
  static Map<String, PMFont> _fonts = {};
  static Future<PMFont> getOrCreate(String ttfName) async {
    if(_fonts.containsKey(ttfName)){
      return _fonts[ttfName];
    } else {
      final ByteData data = await rootBundle.load(ttfName);
      final PMFont font = reader.parseTTFAsset(data);
      _fonts[ttfName] = font;
      return font;
    }
  }

  PMFont myFont;

  void _load(String ttfName) async {
    myFont = await getOrCreate(ttfName);
  }

  Future<List<Path>> getPaths({String font, String text}) async {
    if (myFont == null) {
      _load(font);
    }
    List<Path> paths = [];
    for (var i = 0; i < text.length; ++i) {
      //final charIndex = encoder.convert("f").first;
      final charIndex = text.codeUnitAt(i);
      final completePath = myFont.generatePathForCharacter(charIndex);
      paths.add(completePath);
    }
    return paths;
  }
}
