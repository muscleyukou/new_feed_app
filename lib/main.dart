import 'package:flutter/material.dart';
import 'package:newfeedapp/view/screens/home_screen.dart';
import 'package:newfeedapp/view/screens/style/style.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: BoldFont,
      ),
      home: HomeScreen(),
    );
  }
}
