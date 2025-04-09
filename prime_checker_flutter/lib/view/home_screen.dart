import 'package:flutter/material.dart';
import 'package:prime_checker_flutter/view/mobile/home_mobile.dart';
import 'package:prime_checker_flutter/view/desktop/home_desktop.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return HomeMobile(); // Mobile View
        } else {
          return HomeDesktop(); // Desktop View
        }
      },
    );
  }
}
