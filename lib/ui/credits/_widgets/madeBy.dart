import 'package:flutter/material.dart';

class MadeByWidget extends StatelessWidget {
  const MadeByWidget({
    super.key,
    required this.assetPath,
    this.radius = 50,
    this.isColdTheme = false,
    required this.label,
  });

  final String assetPath;
  final double radius;
  final String label;
  final bool isColdTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: isColdTheme ? Colors.blue : Colors.red,
          radius: radius + 10,
          child: Stack(children: [
            CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(assetPath),
            ),
            isColdTheme
                ? Positioned.fill(
                    top: radius,
                    right: radius,
                    child: Icon(Icons.ac_unit, color: Colors.blue, size: radius),
                  )
                : Positioned.fill(
                    top: radius,
                    left: radius,
                    child: Icon(Icons.local_fire_department_rounded,
                        color: Colors.yellow, size: radius),
                  ),
          ]),
        ),
        Text(
          label,
          style: TextStyle(
            color: isColdTheme ? Colors.blue : Colors.red,
            fontSize: 20,
            shadows: const [
              Shadow(
                blurRadius: 10,
                color: Colors.white,
                offset: Offset(0, 0),
              )
            ],
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
