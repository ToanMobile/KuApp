import 'package:flutter/material.dart';
import 'package:KuApp/utils/uidata.dart';
import 'package:KuApp/widget/webview.dart';

class HomeSupportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSupportState();
  }
}

class HomeSupportState extends State<HomeSupportScreen> {

  @override
  Widget build(BuildContext context) => WebviewKuApp(Config.linkHomeSupport);
}
