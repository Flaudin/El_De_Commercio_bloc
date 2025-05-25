import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutRequest extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class LoadProfile extends AuthEvent {}

class UpdateProfile extends AuthEvent {
  final String? email;
  final String? address;
  final String? birthday;
  final String? phonenumber;

  UpdateProfile({this.email, this.address, this.birthday, this.phonenumber});
}

class RefreshProfile extends AuthEvent {}
