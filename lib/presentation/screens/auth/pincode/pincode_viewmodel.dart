import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PincodeViewModel extends BaseViewModel {
  String _pincode = '';
  String? _pincodeError;
  TextEditingController controller = TextEditingController();

  String get pincode => _pincode;

  String? get pincodeError => _pincodeError;

  bool get isPincodeValid => _pincode.length == 6;

  void onPincodeChanged(String value) {
    _pincode = value;
    if (_pincode.length == 6) {
      _pincodeError = _validatePincode(_pincode);
    } else {
      _pincodeError = null;
    }
    notifyListeners();
  }

  String? _validatePincode(String pincode) {
    if (pincode.length < 6) {
      return 'Pin code must be 6 digits';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(pincode)) {
      return 'Pin code must contain only numbers';
    }
    return null;
  }

  void submitPincode() {
    if (isPincodeValid) {
      print('Pincode Submitted: $_pincode');
    } else {
      print('Invalid pincode');
    }
  }
}
