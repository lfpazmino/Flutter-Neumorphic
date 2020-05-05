import 'package:flutter/services.dart';
import 'package:text_to_path_maker/text_to_path_maker.dart';

class FontProvider {
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
}