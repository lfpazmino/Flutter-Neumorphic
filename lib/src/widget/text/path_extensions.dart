import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

extension ExtrasPath on Path {
  Path clampTo0(){
    var transformMatrix = Matrix4.identity();

    //Translate to start at 0
    var initialPathBounds = this.getBounds();
    print("pathBounds before: $initialPathBounds");

    var tx = 0.0;
    if(initialPathBounds.left < 0){
      tx = -1.0 * initialPathBounds.left;
    }
    var ty = 0.0;
    if(initialPathBounds.top < 0){
      ty = -1.0 *initialPathBounds.top;
    }

    if(tx != 0 || ty != 0){
      final transformMatrix = Matrix4.identity();
      transformMatrix.translate(tx, ty);
      return this.transform(transformMatrix.storage);
    } else {
      return this;
    }
  }

  Path scaleToFit(Size size){
    var transformMatrix = Matrix4.identity();

    //Downscale
    final pathBoundsAfterTranslate = this.getBounds();
    print("pathBounds after translate: $pathBoundsAfterTranslate");

    final scale = min(size.width / pathBoundsAfterTranslate.size.width, size.height / pathBoundsAfterTranslate.size.height);
    print("scale: $scale");
    transformMatrix = Matrix4.identity();
    transformMatrix.scale(scale, -1 * scale); //need to reverse
    return this.transform(transformMatrix.storage);
    //print("pathBounds after scale: ${path.getBounds()}");
  }

  Path reverseY(){
    var transformMatrix = Matrix4.identity();
    transformMatrix.translate(0.0, this.getBounds().size.height); //need to reverse
    return this.transform(transformMatrix.storage);
  }

  Path centerIn(Size size){
    var transformMatrix = Matrix4.identity();
    var dyCenter = 0.0;
    var sizeCenterY = size.height/2;
    var pathCenterY = this.getBounds().size.height / 2;
    if(sizeCenterY < pathCenterY){
      dyCenter = pathCenterY - sizeCenterY;
    } else {
      dyCenter = sizeCenterY - pathCenterY;
    }

    var dxCenter = 0.0;
    var sizeCenterX = size.width/2;
    var pathCenterX = this.getBounds().size.width / 2;
    if(sizeCenterX < pathCenterX){
      dxCenter = pathCenterX - sizeCenterX;
    } else {
      dxCenter = sizeCenterX- pathCenterX;
    }

    transformMatrix.translate(dxCenter, dyCenter); //need to reverse
    return this.transform(transformMatrix.storage);
  }
}


