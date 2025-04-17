import 'dart:convert';

import 'package:tracking_app/data/model/auth_creadentials_model.dart';
import 'package:tracking_app/utils/constants.dart';
import 'package:tracking_app/utils/preference_manager.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final PreferencesManager preferencesManager;

  AuthRepository(this.preferencesManager);

  Future<LoginCredentials?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    final value = {'username': email, 'password': password};
    final json = jsonEncode(value);
    final response = await http.post(
      Uri.parse(baseUrl + loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: json,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
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
