import 'package:flutter/material.dart';
import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:KUCasino.ldt/widget/filled_round_button.dart';

class ForgetPass extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Config.screenHome = false;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Đối với trường hợp bạn quên mật khẩu đăng nhập. Vui lòng ấn vào đây là làm theo hướng dẫn bên dưới:',
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 50,
              child: FilledRoundButton.withGradient(
                gradientColor: MyColors.redMedium_tanHide_gradient,
                text: Text("Đăng ký", style: StylesText.tagLine15SemiBoldWhite),
                cb: () => Navigator.pushNamed(context, '/home'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.forget1),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.forget2),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sau khi lấy lại mật khẩu từ tin nhắn, bạn đăng nhập lại bình thường. Nếu như quên tên đăng nhập, bạn có thể điền bằng Số điện thoại bạn dùng đăng ký tài khoản này.',
            ),
          ],
        ),
      ),
    );
  }
}
