import 'package:flutter/material.dart';
import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:KUCasino.ldt/widget/webview.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config.screenHome = false;
    return WebviewKuApp(Config.linkContact);
  }
}
