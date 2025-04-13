import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/data/model/auth_creadentials_model.dart';

class PreferencesManager {
  static const String keyOnboardingCompleted = 'onboarding_completed';

  Future<bool> hasCompletedOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyOnboardingCompleted) ?? false;
  }

  Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyOnboardingCompleted, true);
  }

  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_authenticated') ?? false;
  }

  Future<void> saveAuthCredentials(LoginCredentials credentials) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', credentials.email);
    await prefs.setString('password', credentials.password);
    await prefs.setBool('is_authenticated', true);
  }

  Future<LoginCredentials?> getAuthCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuth = prefs.getBool('is_authenticated') ?? false;

    if (!isAuth) return null;

    final email = prefs.getString('email') ?? '';
    final password = prefs.getString('password') ?? '';

    if (email.isNotEmpty && password.isNotEmpty) {
      return LoginCredentials(email: email, password: password);
    }
    return null;
  }

  Future<void> clearAuthCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_authenticated', false);
    await prefs.remove('email');
    await prefs.remove('password');
  }
}
