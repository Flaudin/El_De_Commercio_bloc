// ignore_for_file: avoid_print, unused_import

import 'dart:convert';

import 'package:tracking_app/data/model/auth_creadentials_model.dart';
import 'package:tracking_app/utils/constants.dart';
import 'package:tracking_app/utils/preference_manager.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final PreferencesManager preferencesManager;

  AuthRepository(this.preferencesManager);

  Future<LoginCredentials?> login(String email, String password) async {
    try {
      print("Attempting login for $email to ${baseUrl}api/auth/login");
      final response = await http.post(
        Uri.parse('${baseUrl}api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'username': email,
          'password': password,
        }),
      );

      print("Login response status: ${response.statusCode}");
      print("Login response body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // Create minimal credentials if API doesn't return all fields
        if (responseData != null) {
          // If API doesn't return all our model fields, we create them
          final credentials = LoginCredentials(
            email: email,
            password: password,
            address: responseData['address'],
            birthday: responseData['birthday'],
            phonenumber: responseData['phonenumber'],
          );
          return credentials;
        } else {
          throw Exception("Invalid response data");
        }
      } else {
        final errorMsg =
            response.statusCode == 400 || response.statusCode == 401
                ? jsonDecode(response.body)['message'] ??
                    "Authentication failed"
                : "Server Error ${response.statusCode}";
        throw Exception(errorMsg);
      }
    } catch (e) {
      print("Login repository error: $e");
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  // Future<LoginCredentials?> login(String email, String password) async {
  //   await Future.delayed(Duration(seconds: 2));
  //   if (email == "1" && password == "1") {
  //     return LoginCredentials(email: email, password: password);
  //   }
  //   return null;
  // }

  Future<void> logout() async {
    await preferencesManager.clearAuthCredentials();
  }

  Future<LoginCredentials?> checkAuthStatus() async {
    return await preferencesManager.getAuthCredentials();
  }
}
