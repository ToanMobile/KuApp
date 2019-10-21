import 'package:KUCasino.ldt/utils/uidata.dart';
import 'package:KUCasino.ldt/widget/filled_round_button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  //=> WebviewKUCasino.ldt(Config.linkRegister);
  @override
  Widget build(BuildContext context) {
    Config.screenHome = true;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hướng dẫn đăng ký tài khoản KU',
              style: StylesText.body15CenterRegular,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Các bước để tham gia chơi... Đầu tiên bạn cần có 1 tài khoản để đăng nhập và tham gia chơi các trò chơi tại đây.\nChúng tôi quy định “Một khách chỉ được sử dụng một tài khoản”, nếu bạn đã tạo nhiều tài khoản, vui lòng đăng nhập vào tài khoản đầu tiên hoặc lấy lại mật khẩu (trong mục Quên Mật Khẩu) nếu bạn quên.\nĐiều kiện để tham gia: Đủ 18 tuổi.\nBạn cần chuẩn bị:\n-	1 Số điện thoại\n-	1 Tài khoản ngân hàng (tốt nhất có đăng ký Internet banking hoặc Mobile banking)\nSau đó, làm theo hướng dẫn chi tiết sau để đăng ký cho mình một tài khoản\nBước 1: Chọn vào mục Trang Chủ'),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.supportHome),
            const SizedBox(
              height: 10,
            ),
            Text('Hoặc nhấn tại đây ->'),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 50,
              child: FilledRoundButton.withGradient(
                gradientColor: MyColors.redMedium_tanHide_gradient,
                text: Text("Trang chủ", style: StylesText.tagLine15SemiBoldWhite),
                cb: () => Navigator.pushNamed(context, '/home'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Bước 2: Chọn mục Đăng ký bên dưới và điền số điện thoại vào, chọn “Gửi mã xác nhận”, điền mã số gửi về tin nhắn vào ô bên dưới, rồi ấn “Xác nhận”'),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.support1),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.support2),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.support3),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Bước 3: Điền thông tin theo hình.\nLưu ý: bên KU không tuyển đại lý VN. Nên mã đại lý FF379 (số thần tài) đây là để  nhận biết quý khách đã đăng ký khuyến mãi của KU. Và sẽ được nhận hỗ trợ VIP từ KU. Qúy khách vui lòng giữ nguyên mã đại lý FF379 khi đăng ký trên app. Hoặc điền FF379 vào nếu không xuất hiện.'),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.support4),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Bước 4: Bạn cần hoàn tất thông tin trong mục Rút tiền gồm Điền họ tên chính xác (Ví dụ: Nguyen Van A) và Hồ sơ tài khoản ngân hàng. Dựa vào đây sau này bạn sẽ rút tiền về thẻ nên chính xác nhé!'),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.support5),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.support6),
            const SizedBox(
              height: 10,
            ),
            Image.asset(UIData.support7),
          ],
        ),
      ),
    );
  }
}
