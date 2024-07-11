// lib/core/services/auth_service.dart

abstract class AuthService {
  Future<bool> login(String email, String password);
}

class MockAuthService implements AuthService {
  @override
  Future<bool> login(String email, String password) async {
    // Simulate backend call (replace with real backend logic in future)
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    // Mock login logic (use fixed credentials for testing)
    if (email == 'ram@gmail.com' && password == '123') {
      return true; // Successful login
    } else {
      return false; // Invalid credentials
    }
  }
}
