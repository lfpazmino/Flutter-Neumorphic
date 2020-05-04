import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'path_extensions.dart';
import 'package:flutter_neumorphic/src/shape/neumorphic_path_provider.dart';

class TextPathProvider extends NeumorphicPathProvider {
  final Path completePath;

  TextPathProvider(this.completePath);

  @override
  bool shouldReclip(NeumorphicPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    var path = completePath;
    var transformMatrix = Matrix4.identity();

    //Translate to start at 0
    path = path.clampTo0();

    //Downscale
    path = path.scaleToFit(size);

    //because reversed, need to add the size
    path = path.reverseY();

    //now center
    path = path.centerIn(size);

    return path;
  }

  @override
  bool get oneGradientPerPath => true;
}