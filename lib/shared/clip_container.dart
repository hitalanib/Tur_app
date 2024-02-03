import 'package:flutter/material.dart';

class ContainerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 50.0;
    var path = Path();
    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(size.width, 0, size.width - roundnessFactor * 9 - 20,
        roundnessFactor * 3 + 20);
    path.lineTo(roundnessFactor, size.height * 0.3 + 35);
    path.quadraticBezierTo(0, size.height * 0.33 + roundnessFactor, 0,
        size.height * 0.33 + roundnessFactor * 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
