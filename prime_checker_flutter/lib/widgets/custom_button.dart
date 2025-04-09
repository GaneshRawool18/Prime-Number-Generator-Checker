import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.02,
        top: screenHeight * 0.02,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent, 
          foregroundColor: Colors.white, 
          shadowColor: const Color.fromARGB(255, 169, 157, 171), 
          elevation: 10,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.018,
            horizontal: screenWidth * 0.04,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
