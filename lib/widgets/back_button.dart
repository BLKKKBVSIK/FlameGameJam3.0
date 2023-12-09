import 'package:flutter/material.dart';

class GenericBackButton extends StatefulWidget {
  const GenericBackButton({super.key, this.action});

  final VoidCallback? action;

  @override
  State<GenericBackButton> createState() => _GenericBackButtonState();
}

class _GenericBackButtonState extends State<GenericBackButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          widget.action?.call();
        },
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          width: isHovered ? 70 : 50,
          height: isHovered ? 70 : 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              width: 4,
              color: Colors.red,
            ),
          ),
          child: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}
