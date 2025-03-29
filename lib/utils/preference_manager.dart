import 'package:shared_preferences/shared_preferences.dart';

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
}
