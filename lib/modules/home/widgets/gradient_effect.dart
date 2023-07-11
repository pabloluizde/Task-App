import 'package:flutter/material.dart';

class GradientEffect extends StatelessWidget {
  const GradientEffect({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: size.height * 0.03,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                Colors.white,
                Colors.white.withOpacity(0.1),
              ])),
        ),
      ],
    );
  }
}
