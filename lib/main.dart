

import 'package:flutter/material.dart';
import 'package:newfeedapp/view/screens/home_screen.dart';
import 'package:newfeedapp/view/style/style.dart';
import 'package:newfeedapp/viewmodels/head_line_viewmodel.dart';
import 'package:newfeedapp/viewmodels/news_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>NewsListViewModel(),),
      ChangeNotifierProvider(create: (context)=>HeadLineViewModel(),),
    ],
    child: MyApp(),),
  );
}

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
