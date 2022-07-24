import 'package:flutter/material.dart';
import 'package:flutter_application_1/FirstApps/pages/pagesViews/one_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyAppBar"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          OnePage(),
          Container(color: Colors.yellow),
          Container(color: Colors.blue),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavigationBar,
          onTap: (int page) {
            setState(() {
              indexBottomNavigationBar = page;
            });
            _pageController.animateToPage(
              page,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_outlined),
              label: 'item 1',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.android), label: 'item 2'),
            BottomNavigationBarItem(
                icon: Icon(Icons.place_rounded), label: 'item 3'),
          ]),
    );
  }
}
