import 'package:flutter/material.dart';
import 'package:ku_app/utils/uidata.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ForgetPass extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: WebView(
        key: UniqueKey(),
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: Config.linkForgetPass,
      ),
    );
  }
}
