import 'package:flutter/material.dart';
import 'package:newfeedapp/pages/about_us_page.dart';
import 'package:newfeedapp/pages/head_line_page.dart';
import 'package:newfeedapp/pages/news_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _curentIndex = 0;
  final _page = [
    HeadLinePage(),
    NewsListPage(),
    AboutUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _page[_curentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _curentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.highlight),
                  title: const Text("トップニュース")),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.list),
                  title: const Text("ニュース一覧")),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.info),
                  title: const Text("このアプリについて")),
            ],
            onTap: (index) {
              setState(() {
                _curentIndex = index;
              });
            }
        ),
      ),
    );
  }
}
