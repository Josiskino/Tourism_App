import 'package:flutter/material.dart';

class CurveContainerDesign extends StatelessWidget {
  const CurveContainerDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          width: 300,
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const Center(
          child: Text(
            'Custum Container border',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            ),
        ),
      ),
    ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 50, 0)
      ..arcToPoint(
        Offset(size.width, 50),
        radius: const Radius.circular(50),
        clockwise: false,
      )
      ..lineTo(size.width, size.height - 50)
      ..arcToPoint(
        Offset(size.width - 50, size.height),
        radius: const Radius.circular(50),
        clockwise: true,
      )
      ..lineTo(50, size.height)
      ..arcToPoint(
        Offset(0, size.height - 50),
        radius: const Radius.circular(50),
        clockwise: false,
      )
      ..lineTo(0, 50)
      ..arcToPoint(
        const Offset(50, 0),
        radius: const Radius.circular(50),
        clockwise: true,
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}