import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:KUCasino.ldt/widget/webview.dart';
import 'package:flutter/material.dart';

class HomeSupportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSupportState();
  }
}

class HomeSupportState extends State<HomeSupportScreen> {

  @override
  Widget build(BuildContext context) => WebviewKuApp(Config.linkSupport, false);
}
