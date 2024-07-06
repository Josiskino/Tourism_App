import 'package:flutter/material.dart';

class CurveContainerDesign2 extends StatelessWidget {
  const CurveContainerDesign2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(30)),
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
      ..moveTo(265, size.height)
      ..quadraticBezierTo(265, size.height, size.height-290, size.width-20)
      ..quadraticBezierTo(size.height-290, size.width-90, size.height-240, size.width-50)
      
      
      
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}