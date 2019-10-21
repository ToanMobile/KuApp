import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:KUCasino.ldt/widget/filled_round_button.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config.screenHome = false;
    return Container(
      child: Center(
        child: Container(
          width: 200,
          height: 50,
          child: FilledRoundButton.withGradient(
            gradientColor: MyColors.redMedium_tanHide_gradient,
            text: Text("Trang hỗ trợ", style: StylesText.tagLine15SemiBoldWhite),
            cb: () => Navigator.pushNamed(context, '/support'),
          ),
        ),
      ),
    );
  }
}
