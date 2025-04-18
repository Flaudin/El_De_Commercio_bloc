import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/data/model/auth_creadentials_model.dart';

class PreferencesManager {
  static const String keyOnboardingCompleted = 'onboarding_completed';
  static const String authCredentials = 'authCredentials';

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
    await prefs.setString('authCredentials', jsonEncode(credentials.toJson()));
    await prefs.setBool('is_authenticated', true); // Uncomment this line
  }

  Future<LoginCredentials?> getAuthCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final credentialsJson = prefs.getString('authCredentials');

    if (credentialsJson == null || credentialsJson.isEmpty) {
      return null;
    }

    try {
      return LoginCredentials.fromJson(jsonDecode(credentialsJson));
    } catch (e) {
      print("Error parsing stored credentials: $e");
      await clearAuthCredentials(); // Clear invalid credentials
      return null;
    }
  }

  Future<void> clearAuthCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_authenticated', false);
    await prefs.remove('authCredentials');
  }
}
