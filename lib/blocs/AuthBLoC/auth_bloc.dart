// ignore_for_file: override_on_non_overriding_member, avoid_print

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_event.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_state.dart';
import 'package:tracking_app/data/model/auth_creadentials_model.dart';
import 'package:tracking_app/data/repositories/authentucation_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginRequest>(onLoginRequest);
    on<LogoutRequest>(onLogoutRequest);
    on<CheckAuthStatus>(onCheckAuthStatus);

    // Check auth status when bloc is created
    add(CheckAuthStatus());
  }

  Future<void> onLoginRequest(
    LoginRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final creds = await authRepository.login(event.email, event.password);

    if (creds != null) {
      emit(AuthAuthenticated(creds));
    } else {
      emit(AuthFailure("Invalid credentials"));
    }
  }

  Future<void> onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    print("Checking auth status...");
    emit(AuthLoading());
    final credentials = await authRepository.checkAuthStatus();
    print("Credentials found: ${credentials != null}");
    if (credentials != null) {
      emit(AuthAuthenticated(credentials));
    } else {
      emit(AuthInitial());
    }
  }

  void onLogoutRequest(LogoutRequest event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      final stateType = json['state_type'] as String?;
      if (stateType == 'authenticated') {
        final email = json['email'] as String;
        final password = json['password'] as String;
        return AuthAuthenticated(
          LoginCredentials(email: email, password: password),
        );
      }
      return AuthInitial();
    } catch (_) {
      return AuthInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthAuthenticated) {
      return {
        'state_type': 'authenticated',
        'email': state.credentials.email,
        'password': state.credentials.password,
      };
    }
    return {'state_type': 'initial'};
  }
}
