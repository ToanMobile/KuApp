import 'package:flutter/material.dart';
import 'package:ku_app/data/service.dart';
import 'package:ku_app/utils/uidata.dart';
import 'package:ku_app/widget/filled_round_button.dart';
import 'package:ku_app/widget/form_voucher.dart';
import 'package:ku_app/widget/text_input_validation.dart';

class Voucher extends StatefulWidget {
  @override
  VoucherState createState() => VoucherState();
}

class VoucherState extends State<Voucher> {
  bool isNameInputValid = true, isSdtInputValid = true;
  String nameInputValidateErr = "", sdtInputValidateErr = "";

  TextEditingController nameController = new TextEditingController(),
      sdtController = new TextEditingController(),
      tkController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(Margin.marginApp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextInputValidation(
              controller: nameController,
              hintText: "Họ và tên",
              validateErrMsg: getEmailValidateErrMsg(),
              isInputValid: isNameInputValid,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextInputValidation(
              controller: sdtController,
              hintText: "Số điện thoại đăng ký",
              validateErrMsg: getPwdValidateErrMsg(),
              isInputValid: isSdtInputValid,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextInputValidation(
              controller: tkController,
              hintText: "Tên tài khoản KU",
              validateErrMsg: getPwdValidateErrMsg(),
              isInputValid: isNameInputValid,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              width: AppSize.loginButtonWidth,
              height: AppSize.loginButtonHeight,
              child: FilledRoundButton.withGradient(
                gradientColor: MyColors.redMedium_tanHide_gradient,
                text: Text("Gửi", style: StylesText.tagLine15SemiBoldWhite),
                cb: () => saveData(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveData(BuildContext context) {
    LService.getData().then((list) {
      nameController.text = list[0];
      sdtController.text = list[1];
      tkController.text = list[2];
    });
    /*LService.saveSignUp().then(showDone(context, true)).catchError((e) {
      print('catchError');
      showDone(context, false);
    });*/
  }

  showDone(BuildContext context, bool isSuccess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Cảm ơn!"),
          content: new Text(isSuccess
              ? "Đã hoàn thành đăng ký nhận ưu đãi"
              : "Đăng ký nhận ưu đãi không thành công. Vui lòng thử lại!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Đồng ý."),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool notBlank(String input) => input.length != 0;

  void validateForm() {
    isNameInputValid = notBlank(nameController.text);
    isSdtInputValid = notBlank(tkController.text);

    if (isNameInputValid && isSdtInputValid) {
      // TODO: Call API here
    } else {
      setState(() {});
    }
  }

  String getEmailValidateErrMsg() {
    // TODO: using switch case to get another validate message type
    if (!isNameInputValid) {
      return "This field can not blank!";
    }
    return null;
  }

  String getPwdValidateErrMsg() {
    if (!isSdtInputValid) {
      return "This field can not blank!";
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    sdtController.dispose();
    tkController.dispose();
    super.dispose();
  }
}
