import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

Path pathClampTo0(Path path) {
  var transformMatrix = Matrix4.identity();

  //Translate to start at 0
  var initialPathBounds = path.getBounds();
  print("pathBounds before: $initialPathBounds");

  var tx = 0.0;
  if (initialPathBounds.left < 0) {
    tx = -1.0 * initialPathBounds.left;
  }
  var ty = 0.0;
  if (initialPathBounds.top < 0) {
    ty = -1.0 * initialPathBounds.top;
  }

  if (tx != 0 || ty != 0) {
    final transformMatrix = Matrix4.identity();
    transformMatrix.translate(tx, ty);
    return path.transform(transformMatrix.storage);
  } else {
    return path;
  }
}

Path pathScaleToFit(Path path, Size size) {
  var transformMatrix = Matrix4.identity();

  //Downscale
  final pathBoundsAfterTranslate = path.getBounds();
  print("pathBounds after translate: $pathBoundsAfterTranslate");

  final scale = min(size.width / pathBoundsAfterTranslate.size.width, size.height / pathBoundsAfterTranslate.size.height);
  print("scale: $scale");
  transformMatrix = Matrix4.identity();
  transformMatrix.scale(scale, -1 * scale); //need to reverse
  return path.transform(transformMatrix.storage);
  //print("pathBounds after scale: ${path.getBounds()}");
}

Path pathReverseY(Path path) {
  var transformMatrix = Matrix4.identity();
  transformMatrix.translate(0.0, path.getBounds().size.height); //need to reverse
  return path.transform(transformMatrix.storage);
}

Path pathCenterIn(Path path, Size size) {
  var transformMatrix = Matrix4.identity();
  var dyCenter = 0.0;
  var sizeCenterY = size.height / 2;
  var pathCenterY = path.getBounds().size.height / 2;
  if (sizeCenterY < pathCenterY) {
    dyCenter = pathCenterY - sizeCenterY;
  } else {
    dyCenter = sizeCenterY - pathCenterY;
  }

  var dxCenter = 0.0;
  var sizeCenterX = size.width / 2;
  var pathCenterX = path.getBounds().size.width / 2;
  if (sizeCenterX < pathCenterX) {
    dxCenter = pathCenterX - sizeCenterX;
  } else {
    dxCenter = sizeCenterX - pathCenterX;
  }

  transformMatrix.translate(dxCenter, dyCenter); //need to reverse
  return path.transform(transformMatrix.storage);
}
