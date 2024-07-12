// lib/ui/viewmodels/login_viewmodel.dart

import 'package:stacked/stacked.dart';

import '../../../core/authservices.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService _authService = MockAuthService(); // Use mock service

  final _emailLabel = 'Email';
  final _passwordLabel = 'Password';
  final _required = '*';

  String _email = '';
  String _password = '';
  String? _emailErr;
  String? _passwordErr;

  String get email => _email;
  String get password => _password;
  String get emailLabel => _emailLabel;
  String get passwordLabel => _passwordLabel;
  String get required => _required;
  String? get emailError => _emailErr;
  String? get passwordError => _passwordErr;

  void setEmail(String value) {
    _email = value;
    _emailErr = null;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _passwordErr = null;
    notifyListeners();
  }

  Future<bool> login() async {
    if (_email.isEmpty) {
      _emailErr = 'Email is required';
    }
    if (_password.isEmpty) {
      _passwordErr = 'Password is required';
    }

    if (_emailErr != null || _passwordErr != null) {
      notifyListeners();
      return false;
    }

    setBusy(true);
    bool success = await _authService.login(_email, _password);
    setBusy(false);
    return success;
  }
}
