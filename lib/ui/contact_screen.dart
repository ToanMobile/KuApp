import 'package:KUCasino/utils/uidata.dart';
import 'package:KUCasino/widget/webview.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config.screenHome = false;
    return Scaffold(
      body: WebviewKuApp(Config.linkHomeSupport, true),
    );
  }
}
