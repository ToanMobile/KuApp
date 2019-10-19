import 'package:flutter/material.dart';
import 'package:ku_app/ui/contact_screen.dart';
import 'package:ku_app/ui/forget_pass_screen.dart';
import 'package:ku_app/ui/signup_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_paused),
              title: Text('Liên hệ hỗ trợ'))
        ],
        currentIndex: _selectedBottomIndex,
        selectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
