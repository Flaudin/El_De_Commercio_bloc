import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_bloc.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_state.dart';
import 'package:tracking_app/presentation/screens/auth/pages/login_screen.dart';
import 'package:tracking_app/presentation/screens/home/home_screen.dart';

class AuthGuard extends ChangeNotifier {
  final BuildContext context;

  AuthGuard(this.context) {
    context.read<AuthBloc>().stream.listen((state) {
      notifyListeners();
    });
  }

  bool get isAuthenticated =>
      context.read<AuthBloc>().state is AuthAuthenticated;
}

GoRouter getRouter(BuildContext context) {
  final authGuard = AuthGuard(context);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authGuard,
    redirect: (context, state) {
      final isAuthenticated = authGuard.isAuthenticated;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isAuthenticated && !isLoggingIn) return '/login';
      if (isAuthenticated && isLoggingIn) return '/home';

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: 'home', builder: (context, state) => HomeScreen()),
    ],
  );
}
