import 'package:flutter/material.dart';
import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:KUCasino.ldt/widget/filled_round_button.dart';
import 'package:KUCasino.ldt/widget/webview.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(UIData.iconApp),
            Container(
              width: 200,
              height: 50,
              child: FilledRoundButton.withGradient(
                gradientColor: MyColors.redMedium_tanHide_gradient,
                text: Text("Trang chủ", style: StylesText.tagLine15SemiBoldWhite),
                cb: () => Navigator.pushNamed(context, '/home'),
              ),
            ),
          ],
        )
      ),
    );
  }
}
