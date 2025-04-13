import 'package:tracking_app/data/model/auth_creadentials_model.dart';
import 'package:tracking_app/utils/preference_manager.dart';

class AuthRepository {
  final PreferencesManager preferencesManager;

  AuthRepository(this.preferencesManager);

  Future<LoginCredentials?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (email == "admin" && password == "pass") {
      return LoginCredentials(email: email, password: password);
    }
    return null;
  }

  Future<void> logout() async {
    await preferencesManager.clearAuthCredentials();
  }

  Future<LoginCredentials?> checkAuthStatus() async {
    return await preferencesManager.getAuthCredentials();
  }
}
