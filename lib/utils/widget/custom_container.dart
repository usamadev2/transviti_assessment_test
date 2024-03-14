import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShap extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var width = size.width;
    var height = size.height;
    var radius = 25.0;

    path.moveTo(0, height - 280.h);
    path.lineTo(width - radius, 0);
    path.arcToPoint(
      Offset(width, radius),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    path.lineTo(width, height - radius);
    path.arcToPoint(
      Offset(width - radius, height),
      radius: Radius.circular(radius),
    );

    path.lineTo(radius, height);
    path.arcToPoint(Offset(0, height - radius), radius: Radius.circular(radius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
