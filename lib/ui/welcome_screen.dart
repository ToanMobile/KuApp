import 'package:flutter/material.dart';

import '../utils/uidata.dart';

class Welcome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(Margin.marginApp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'GIỚI THIỆU VỀ KUCASINO',
                  style: StylesText.headline3RightBold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                    'KUCASINO là ứng dụng đầu tiên và hàng đầu hiên nay mới được ra mắt bởi đội ngũ phát triển lập trình của chúng tôi.\n\nHiện đang đi đầu trong lĩnh vực giải trí hiện nay, chúng tôi với 15 năm kinh nghiệm trong các lĩnh vực "giải trí"... và các hạng mục khác.\n\nKUCASINO được kế thừa và phát triển từ phiên bản cũ THA.\n\nGiao diện và các trò chơi được thêm vào nhằm tăng trải nghiệm người dùng.\n\nKUCASINO hiện được đặt trụ sở tại tòa cao ốc RCBC tại thủ đô của Manila, đồng thời được cấp phép Isle of Man & Cagayan Economic Zone and Free Port theo sự giám sát và bảo trợ của chính phủ Philippines.',
                    style: StylesText.body15LeftRegularSlate),
                const SizedBox(height: 30),
                Text('GIỚI THIỆU VỀ ĐỘI NGŨ PHÁT TRIỂN KUCASINO',
                    style: StylesText.headline3RightBold, textAlign: TextAlign.center),
                const SizedBox(height: 10),
                Text(
                    'Chúng tôi được thành lập từ đội ngũ phát triển dự án KU, đến nay với 5 năm kinh nghiệm sau khi thành công với ứng dụng THA, chúng tôi tiếp tục nghiên cứu và cải tiến không ngừng nhằm tăng trải nghiệm cho người sử dụng trên nhiều nền tảng hệ điều hành, trên nhiều thiết bị khác nhau.\n\nĐặc biệt, đối với phiên bản trên thiết bị Android chúng tôi đã có thêm vào nhiều tính năng và chức năng đặc biệt, nhằm giúp người dùng có những giây phút tuyệt vời nhất trên ứng dụng do chúng tôi tạo nên.\n\nĐiều cuối cùng, chúng tôi mong muốn nhận được sự ủng hộ và những ý kiến đóng góp của các bạn, từ đó tạo nền tảng cho những ứng dụng sau này.',
                    style: StylesText.body15LeftRegularSlate),
              ],
            ),
          )),
    );
  }
}
