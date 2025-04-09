import 'package:flutter/material.dart';
import 'package:prime_checker_flutter/view/mobile/home_mobile.dart';
import 'package:provider/provider.dart';
import 'controller/prime_provider.dart';

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
      title: 'Prime Checker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeMobile(),
    );
  }
}
