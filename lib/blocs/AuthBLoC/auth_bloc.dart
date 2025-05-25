// ignore_for_file: override_on_non_overriding_member, avoid_print

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_event.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_state.dart';
import 'package:tracking_app/data/model/auth_creadentials_model.dart';
import 'package:tracking_app/data/repositories/authentucation_repository.dart';
import 'package:tracking_app/utils/preference_manager.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PreferencesManager preferencesManager;
  final AuthRepository authRepository;

  AuthBloc(this.authRepository, this.preferencesManager)
    : super(AuthInitial()) {
    on<LoginRequest>(onLoginRequest);
    on<LogoutRequest>(onLogoutRequest);
    on<CheckAuthStatus>(onCheckAuthStatus);

    // Profile related events
    on<LoadProfile>(onLoadProfile);
    on<UpdateProfile>(onUpdateProfile);
    on<RefreshProfile>(onRefreshProfile);

    // Check auth status when bloc is created
    add(CheckAuthStatus());
  }

  Future<void> onLoginRequest(
    LoginRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      print("Attempting login with: ${event.email}");
      final creds = await authRepository.login(event.email, event.password);
      if (creds != null) {
        await authRepository.preferencesManager.saveAuthCredentials(creds);
        print("Login successful, emitting AuthAuthenticated");
        emit(AuthAuthenticated(creds));
      } else {
        print("Login failed: null credentials returned");
        emit(AuthFailure("Login failed"));
      }
    } catch (e) {
      print("Login error: $e");
      final errorMessage = e.toString().replaceAll("Exception: ", "");
      emit(AuthFailure(errorMessage));
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

  void onLogoutRequest(LogoutRequest event, Emitter<AuthState> emit) async {
    await authRepository.preferencesManager.clearAuthCredentials();
    emit(AuthInitial());
  }

  Future<void> onLoadProfile(LoadProfile event, Emitter<AuthState> emit) async {
    try {
      emit(ProfileLoading());
      final credentials = await preferencesManager.getAuthCredentials();
      if (credentials != null) {
        emit(AuthAuthenticated(credentials));
      } else {
        emit(AuthFailure('No profile found'));
      }
    } catch (e) {
      emit(AuthFailure('Failed to load profile'));
    }
  }

  Future<void> onUpdateProfile(
    UpdateProfile event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is AuthAuthenticated) {
        emit(ProfileLoading());

        final currentCredentials = currentState.credentials;
        final updatedCredentials = LoginCredentials(
          email: event.email ?? currentCredentials.email,
          password: currentCredentials.password,
          address: currentCredentials.address,
          birthday: currentCredentials.birthday,
          phonenumber: currentCredentials.phonenumber,
        );
        emit(ProfileUpdated(credentials: updatedCredentials));

        // Transition back to authenticated state
        await Future.delayed(Duration(milliseconds: 500));
      } else {
        emit(AuthFailure('No authenticated user found'));
      }
    } catch (e) {
      emit(AuthFailure('Failed to update profile'));
    }
  }

  Future<void> onRefreshProfile(
    RefreshProfile event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is AuthAuthenticated) {
        emit(ProfileLoading());

        final credentials = await preferencesManager.getAuthCredentials();
        if (credentials != null) {
          emit(ProfileUpdated(credentials: credentials));
        } else {
          emit(AuthFailure('No profile found'));
        }
      } else {
        emit(AuthFailure('No authenticated user found'));
      }
    } catch (e) {
      emit(AuthFailure('Failed to refresh profile'));
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
