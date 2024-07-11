// lib/ui/viewmodels/login_viewmodel.dart

import 'package:stacked/stacked.dart';

import '../../../core/authservices.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService _authService = MockAuthService(); // Use mock service

  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<bool> login() async {
    setBusy(true);
    bool success = await _authService.login(_email, _password);
    setBusy(false);
    return success;
  }
}
