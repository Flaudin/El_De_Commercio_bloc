import 'package:equatable/equatable.dart';
import 'package:tracking_app/data/model/auth_creadentials_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final LoginCredentials credentials;
  AuthAuthenticated(this.credentials);

  @override
  List<Object?> get props => [credentials];
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class ProfileLoading extends AuthState {}

class ProfileUpdated extends AuthState {
  final LoginCredentials credentials;
  ProfileUpdated({required this.credentials});
}
