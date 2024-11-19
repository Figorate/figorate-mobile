import 'package:stacked/stacked.dart';

class SignupManuallyViewmodel extends BaseViewModel {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';

  String? _firstNameError;
  String? _lastNameError;
  String? _emailError;
  String? _passwordError;

  String? get firstNameError => _firstNameError;
  String? get lastNameError => _lastNameError;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;

  bool get isFormValid =>
      _firstName.isNotEmpty &&
      _lastName.isNotEmpty &&
      _email.isNotEmpty &&
      _password.isNotEmpty &&
      _firstNameError == null &&
      _lastNameError == null &&
      _emailError == null &&
      _passwordError == null;

  void onFirstNameChanged(String value) {
    _firstName = value;
    _firstNameError = _validateName(value);
    notifyListeners();
  }

  void onLastNameChanged(String value) {
    _lastName = value;
    _lastNameError = _validateName(value);
    notifyListeners();
  }

  void onEmailChanged(String value) {
    _email = value;
    _emailError = _validateEmail(value);
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    _password = value;
    _passwordError = _validatePassword(value);
    notifyListeners();
  }

  String? _validateName(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? _validateEmail(String value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
