import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;

  const CommonButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
    this.width = 200.0, // Default width
    this.height = 50.0, // Default height
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(width, height),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
