import 'package:flutter/material.dart';
import 'package:ku_app/utils/uidata.dart';
import 'package:ku_app/widget/webview.dart';

class HomeLinkScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeLinkState();
  }
}

class HomeLinkState extends State<HomeLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Trang chủ KuApp'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: WebviewKuApp(Config.linkHome),
    );
  }
}