import 'package:flutter/material.dart';
import 'package:prime_checker_flutter/controller/prime_provider.dart';
import 'package:prime_checker_flutter/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrimeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexColorScheme.light(scheme: FlexScheme.material).toTheme, 
      home: HomeScreen(),
    );
  }
}
