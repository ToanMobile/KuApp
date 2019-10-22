import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:KUCasino.ldt/widget/webview.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config.screenHome = false;
    return WebviewKuApp(Config.linkHomeSupport, true);
  }
}
