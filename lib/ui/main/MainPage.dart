import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/main/TodayScreen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8F8F8),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff0F2935),
        backgroundColor: Color(0XFFF8F8F8),
        animationDuration: Duration(milliseconds: 250),
        items: <Widget>[
          Icon(Icons.attach_money, color: Colors.white, size: 30),
          Icon(Icons.add, color: Colors.white, size: 30),
          Icon(Icons.pie_chart, color: Colors.white, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: TodayScreen(),
    );
  }
}
