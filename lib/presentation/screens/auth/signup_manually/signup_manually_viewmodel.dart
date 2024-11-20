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

  String get passwordStrengthMessage {
    if (_password.isEmpty) return 'Enter a password';
    if (_isPasswordStrong) return 'Strong Password';
    return 'Weak Password';
  }

  bool get _isPasswordStrong =>
      _password.length >= 8 &&
      RegExp(r'[A-Z]').hasMatch(_password) &&
      RegExp(r'[0-9]').hasMatch(_password) &&
      RegExp(r'[^A-Za-z0-9]').hasMatch(_password); 

  bool get isPasswordStrong => _isPasswordStrong;

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
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (value.contains(' ')) {
      return 'Password cannot contain spaces';
    }
    if (_firstName.toLowerCase().contains(value.toLowerCase()) ||
        _lastName.toLowerCase().contains(value.toLowerCase()) ||
        _email.toLowerCase().contains(value.toLowerCase())) {
      return 'Password cannot contain your name or email';
    }
    if (!RegExp(r'[0-9]').hasMatch(value) && !RegExp(r'[^A-Za-z0-9]').hasMatch(value)) {
      return 'Password must contain at least one symbol or number';
    }
    return null;
  }
}
