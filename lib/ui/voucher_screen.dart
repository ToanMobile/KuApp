import 'package:KUCasino/data/service.dart';
import 'package:KUCasino/utils/uidata.dart';
import 'package:KUCasino/widget/filled_round_button.dart';
import 'package:KUCasino/widget/text_input_validation.dart';
import 'package:flutter/material.dart';

class Voucher extends StatefulWidget {
  @override
  VoucherState createState() => VoucherState();
}

class VoucherState extends State<Voucher> {
  bool isNameInputValid = true, isSdtInputValid = true, isTKInputValid = true;
  String nameInputValidateErr = "", sdtInputValidateErr = "", tkInputValidateErr = "";
  bool _isDone = true;

  TextEditingController nameController = new TextEditingController(),
      sdtController = new TextEditingController(),
      tkController = new TextEditingController();

  void setSendData(bool isDone) {
    setState(() => this._isDone = isDone);
  }

  @override
  Widget build(BuildContext context) {
    Config.screenHome = false;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Margin.marginApp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextInputValidation(
                controller: nameController,
                hintText: "Họ và tên",
                validateErrMsg: getNameValidateErrMsg(),
                isInputValid: isNameInputValid,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextInputValidation(
                controller: sdtController,
                hintText: "Số điện thoại hoặc Zalo",
                validateErrMsg: getSDTValidateErrMsg(),
                isInputValid: isSdtInputValid,
                isInputNumber: true,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextInputValidation(
                controller: tkController,
                hintText: "Tên tài khoản KU",
                validateErrMsg: getTKValidateErrMsg(),
                isInputValid: isTKInputValid
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
                        text: Text("Gửi", style: StylesText.tagLine15SemiBoldWhite),
                        cb: () => saveData(context),
                      ),
                    )
                  : CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  saveData(BuildContext context) {
    validateForm();
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

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  void validateForm() {
    isNameInputValid = notBlank(nameController.text);
    isSdtInputValid = notBlank(sdtController.text) && sdtController.text.length == 10 && _isNumeric(sdtController.text);
    isTKInputValid = notBlank(tkController.text) &&
        (tkController.text.length > 3 && tkController.text.length < 11);
    if (isNameInputValid && isSdtInputValid && isTKInputValid) {
      setSendData(false);
      LService.saveSignUp(nameController.text.toString(), sdtController.text.toString(), tkController.text.toString()).then((value) {
        print('then===' + value.toString());
        if (value) {
          showDone(context, true);
        } else {
          showDone(context, false);
        }
      }).catchError((e) {
        print(e);
        showDone(context, false);
      });
    } else {
      showEmty(context);
    }
  }

  String getNameValidateErrMsg() {
    if (!isNameInputValid) {
      return "Không được để trống!";
    }
    return "";
  }

  String getSDTValidateErrMsg() {
    if (!isSdtInputValid) {
      if (sdtController.text.length == 0) {
        return "Không được để trống!";
      } else if (sdtController.text.length != 10) {
        return "Vui lòng nhập số điện thoại(10 chữ số)!";
      } else if (!_isNumeric(sdtController.text)) {
        return "Chỉ được nhập số!";
      }
    }
    return "";
  }

  String getTKValidateErrMsg() {
    if (!isTKInputValid) {
      if (tkController.text.length == 0) {
        return "Không được để trống!";
      } else if (tkController.text.length < 4 || tkController.text.length > 10) {
        return "Vui lòng nhập tên tài khoản(4-10 ký tự)!";
      }
    }
    return "";
  }

  @override
  void dispose() {
    nameController.dispose();
    sdtController.dispose();
    tkController.dispose();
    super.dispose();
  }
}
