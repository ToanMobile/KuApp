import 'package:flutter/material.dart';
import 'package:KuApp/data/service.dart';
import 'package:KuApp/utils/uidata.dart';
import 'package:KuApp/widget/filled_round_button.dart';
import 'package:KuApp/widget/text_input_validation.dart';

class Voucher extends StatefulWidget {
  @override
  VoucherState createState() => VoucherState();
}

class VoucherState extends State<Voucher> {
  bool isNameInputValid = true, isSdtInputValid = true;
  String nameInputValidateErr = "", sdtInputValidateErr = "";
  bool _isDone = true;

  TextEditingController nameController = new TextEditingController(),
      sdtController = new TextEditingController(),
      tkController = new TextEditingController();

  void setSendData(bool isDone) {
    setState(() => this._isDone = isDone);
  }

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
            _isDone
                ? Container(
                    width: AppSize.loginButtonWidth,
                    height: AppSize.loginButtonHeight,
                    child: FilledRoundButton.withGradient(
                      gradientColor: MyColors.redMedium_tanHide_gradient,
                      text:
                          Text("Gửi", style: StylesText.tagLine15SemiBoldWhite),
                      cb: () => saveData(context),
                    ),
                  )
                : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  saveData(BuildContext context) {
    if (nameController.text.isNotEmpty &&
        sdtController.text.isNotEmpty &&
        tkController.text.isNotEmpty) {
      setSendData(false);
      LService.saveSignUp(
              nameController.text, sdtController.text, tkController.text)
          .then((value) {
        print('then' + value.toString());
        if (value) {
          showDone(context, true);
        } else {
          showDone(context, false);
        }
      }).catchError((e) {
        print('catchError');
        showDone(context, false);
      });
    } else {
      showEmty(context);
    }
    /*
    //TODO GET Data google SHEET
    LService.getData().then((list) {
      nameController.text = list[0];
      sdtController.text = list[1];
      tkController.text = list[2];
    });
    */
  }

  showDone(BuildContext context, bool isSuccess) {
    setSendData(true);
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

  showEmty(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Lỗi!"),
          content: new Text("Xin vui lòng điền đầy đủ thông tin."),
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
