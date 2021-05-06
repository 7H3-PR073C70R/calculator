import 'package:flutter/material.dart';
import 'package:testss/screens/calculator_screen.dart';
import 'package:testss/screens/geometry_screen.dart';
import 'package:testss/screens/unit_converter_screen.dart';

import 'screens/recent_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ultimate Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      routes: {
        UnitConverterScreen.routeName: (_) => UnitConverterScreen(),
        CalculatorScreen.routeName: (_) => CalculatorScreen(),
        GeometryScreen.routeName: (_) => GeometryScreen(),
        RecentScreen.routeName: (_) => RecentScreen()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalculatorScreen();
  }
}
