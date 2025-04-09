import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  
  const AnimatedTextWidget({required this.text, required this.fontSize, Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      child: Text(text),
      style: TextStyle(fontSize: fontSize, color: Colors.black),
      duration: Duration(milliseconds: 300),
    );
  }
}
