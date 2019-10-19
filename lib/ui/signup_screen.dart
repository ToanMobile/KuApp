import 'package:flutter/material.dart';
import 'package:ku_app/utils/uidata.dart';
import 'package:ku_app/widget/webview.dart';

class SignUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => WebviewKuApp(Config.linkRegister);

}
