import 'package:flutter/material.dart';
import 'package:project/pages/navpages/bar_item_page.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/navpages/my_page.dart';
import 'package:project/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    homePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.amber,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: "bar",
            icon: Icon(Icons.bar_chart_sharp),
          ),
          BottomNavigationBarItem(
            label: "search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "myPage",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
