import 'package:KUCasino.ldt/ui/home_support_screen.dart';
import 'package:KUCasino.ldt/ui/not_found_page.dart';
import 'package:KUCasino.ldt/ui/voucher_screen.dart';
import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:flutter/material.dart';

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

  Future<bool> _onWillPop() {
    if (Config.screenHome) {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Thoát ứng dụng?'),
              content: new Text('Bạn muốn thoát App!'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('Không'),
                ),
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Có'),
                ),
              ],
            ),
          ) ??
          false;
    } else {
      _onItemTapped(0);
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _onWillPop();
      },
      child: Scaffold(
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
      ),
    );
  }
}
