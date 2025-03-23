import 'package:tracking_app/data/model/auth_creadentials_model.dart';

class AuthRepository {
  Future<LoginCredentials?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (email == "admin" && password == "pass") {
      return LoginCredentials(email: email, password: password);
    }
    return null;
  }
}
