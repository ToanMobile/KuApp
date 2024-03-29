import 'dart:io' show Platform, exit;

import 'package:KUCasino/ui/home_screen.dart';
import 'package:KUCasino/ui/not_found_page.dart';
import 'package:KUCasino/ui/support_screen.dart';
import 'package:KUCasino/ui/voucher_screen.dart';
import 'package:KUCasino/ui/welcome_screen.dart';
import 'package:KUCasino/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class Main extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Trang chủ", Icons.home),
    DrawerItem("Giới thiệu", Icons.info),
    DrawerItem("Hướng dẫn", Icons.supervisor_account),
    DrawerItem("Nhận khuyến mãi", Icons.card_giftcard)
  ];

  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<Main> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Home();
      case 1:
        return Welcome();
      case 2:
        return Support();
      case 3:
        return Voucher();
      default:
        return NotFoundPage();
    }
  }

  void _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  bool checkTimeExit() {
    DateTime currentDate = DateTime.now();
    var dateExpire = DateTime.parse("2020-06-00 00:00:00Z");
    if (currentDate.millisecondsSinceEpoch > dateExpire.millisecondsSinceEpoch) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    print(checkTimeExit());
    if (checkTimeExit()) {
      exit(0);
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(
          d.icon,
          color: _selectedDrawerIndex == i ? Colors.lightBlueAccent : Colors.black,
          size: 40,
        ),
        title: new Text(
          d.title,
          style: TextStyle(color: _selectedDrawerIndex == i ? Colors.lightBlueAccent : Colors.black, fontSize: 16),
        ),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 200,
              margin: EdgeInsets.only(top: 50),
              child: Image.asset(
                UIData.iconApp,
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
