// ignore_for_file: file_names

import 'package:flutter/material.dart';

// A custom clipper to give the seats its shape around the actual seat widget
// This clipper clips the rectangle from the top
class MyCustomCliperFromTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height * 0.7;
    double width = size.width;
    Path path = Path()
      ..moveTo(0, height)
      ..lineTo(0, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(width - 10, height)
      ..lineTo(width - 10, 10)
      ..lineTo(10, 10)
      ..lineTo(10, height)
      ..lineTo(0, height);

    return path;
  }
  //Called whenever a new instance of the custom clipper delegate class is provided
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
// This clipper clips the rectangle from the bottom
class MyCustomCliperFromBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height * 0.3;
    double width = size.width;
    Path path = Path()
      ..moveTo(0, height)
      ..lineTo(0, size.height)
      ..lineTo(width, size.height)
      ..lineTo(width, height)
      ..lineTo(width - 10, height)
      ..lineTo(width - 10, size.height - 10)
      ..lineTo(10, size.height - 10)
      ..lineTo(10, height)
      ..lineTo(0, height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
