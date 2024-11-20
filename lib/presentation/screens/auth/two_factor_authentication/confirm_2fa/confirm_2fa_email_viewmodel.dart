import 'package:figorate_mobile/services/locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Confirm2faEmailViewmodel extends BaseViewModel {
  TextEditingController controller = TextEditingController();
  bool isPincodeValid = false;

  void onPincodeChanged(String value) {
    isPincodeValid = value.length == 6 && int.tryParse(value) != null;
    notifyListeners();
  }

  void onConfirm() {
    if (isPincodeValid) {
      print('Pin code confirmed: ${controller.text}');
      navigationService.pushNamed("/enable-finger-print");
    } else {
      print('Invalid pin code');
    }
  }
}
