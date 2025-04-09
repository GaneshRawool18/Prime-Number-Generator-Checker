import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  
  const NumberInputField({required this.controller, required this.label, Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        style: TextStyle(fontSize: screenWidth * 0.04),
      ),
    );
  }
}
