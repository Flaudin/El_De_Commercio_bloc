import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_event.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_state.dart';
import 'package:tracking_app/data/repositories/authentucation_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginRequest>(onLoginRequest);
    on<LogoutRequest>(onLogoutRequest);
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

  void onLogoutRequest(LogoutRequest event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
