import 'package:flutter/material.dart';
import 'package:ku_app/ui/home_support_screen.dart';
import 'package:ku_app/ui/not_found_page.dart';
import 'package:ku_app/ui/voucher_screen.dart';
import 'package:ku_app/utils/uidata.dart';

import 'contact_screen.dart';
import 'home_rss_screen.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int _selectedBottomIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });
  }

  _getBottomItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeRssScreen();
      case 1:
        return Voucher();
      case 2:
        return Contact();
      default:
        return NotFoundPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBottomItemWidget(_selectedBottomIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(UIData.iconTabHome),
            title: Text('Trang chủ'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(UIData.iconTabVoucher),
            title: Text('Nhận khuyến mãi'),
          ),
          BottomNavigationBarItem(icon: Image.asset(UIData.iconTabsupport), title: Text('Liên hệ hỗ trợ'))
        ],
        iconSize: 30,
        currentIndex: _selectedBottomIndex,
        unselectedIconTheme: IconThemeData(color: Colors.black26, opacity: 1.0, size: 30.0),
        selectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
