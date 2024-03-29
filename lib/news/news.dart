import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_items.dart';

class News extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsState();
  }
}

class _NewsState extends State<News> {
  int _currentTab = 0;

  static List<Widget> _listPages = <Widget>[
    new NewsItems(),
    Text(
      'Food',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
    Text(
      'User',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
    Text(
      'Training',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
    Text(
      'Map',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
  ];

  void _selectTab(int tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPages.elementAt(_currentTab),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: 'News',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_outlined),
              label: 'Food',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'User',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_outlined),
              label: 'Training',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
              backgroundColor: Colors.white),
        ],
        currentIndex: _currentTab,
        selectedItemColor: const Color(0xFFD1414F),
        unselectedItemColor: const Color(0xFFCED0D5),
        onTap: _selectTab,
      ),
    );
  }
}
