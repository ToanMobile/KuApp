import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:KUCasino.ldt/ui/contact_screen.dart';
import 'package:KUCasino.ldt/ui/forget_pass_screen.dart';
import 'package:KUCasino.ldt/ui/signup_screen.dart';

import 'not_found_page.dart';

class Support extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SupportState();
  }
}

class SupportState extends State<Support> {
  int _selectedBottomIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });
  }

  _getBottomItemWidget(int pos) {
    switch (pos) {
      case 0:
        return SignUp();
      case 1:
        return ForgetPass();
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
              icon: Icon(Icons.supervised_user_circle),
              title: Text('Tạo tài khoản'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              title: Text('Quên mật khẩu'),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.phone_paused), title: Text('Liên hệ hỗ trợ'))
          ],
          currentIndex: _selectedBottomIndex,
          selectedItemColor: Colors.lightBlueAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
