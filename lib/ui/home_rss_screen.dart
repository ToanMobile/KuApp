import 'package:flutter/material.dart';
import 'package:ku_app/utils/uidata.dart';
import 'package:ku_app/widget/filled_round_button.dart';
import 'package:ku_app/widget/webview.dart';

class HomeRssScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeRssState();
  }
}

class HomeRssState extends State<HomeRssScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 200,
          height: 50,
          child: FilledRoundButton.withGradient(
            gradientColor: MyColors.redMedium_tanHide_gradient,
            text: Text("Trang chủ", style: StylesText.tagLine15SemiBoldWhite),
            cb: () => Navigator.pushNamed(context, '/home'),
          ),
        ),
      ),
    );
  }
}
