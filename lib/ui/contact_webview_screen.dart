import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:KUCasino.ldt/widget/webview.dart';
import 'package:flutter/material.dart';

class ContactWebview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 30),
      child: WebviewKuApp(Config.linkHomeSupport, true),
    );
  }
}
