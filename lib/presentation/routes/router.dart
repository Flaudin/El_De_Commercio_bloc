// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_bloc.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_event.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_state.dart';
import 'package:tracking_app/presentation/screens/account/account_screen.dart';
import 'package:tracking_app/presentation/screens/account/components/add_address_screen.dart';
import 'package:tracking_app/presentation/screens/account/components/address_screen.dart';
import 'package:tracking_app/presentation/screens/account/components/notification_screen.dart';
import 'package:tracking_app/presentation/screens/account/components/privacy_policy_screen.dart';
import 'package:tracking_app/presentation/screens/account/components/profile_screen.dart';
import 'package:tracking_app/presentation/screens/account/components/security_screen.dart';
import 'package:tracking_app/presentation/screens/auth/pages/login_screen.dart';
import 'package:tracking_app/presentation/screens/auth/pages/signup_screen.dart';
import 'package:tracking_app/presentation/screens/cart/cart_screen.dart';
import 'package:tracking_app/presentation/screens/category/category_screen.dart';
import 'package:tracking_app/presentation/screens/home/home_screen.dart';
import 'package:tracking_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:tracking_app/presentation/screens/product/product_screen.dart';
import 'package:tracking_app/presentation/screens/product_list/product_list_screen.dart';
import 'package:tracking_app/presentation/screens/shellscreen/shell_screen.dart';
import 'package:tracking_app/utils/preference_manager.dart';

class AuthGuard extends ChangeNotifier {
  final BuildContext context;
  bool isInitialCheckDone = false;

  AuthGuard(this.context) {
    context.read<AuthBloc>().stream.listen((state) {
      print("Auth state changed: $state");
      notifyListeners();
    });
  }

  void checkAuthStatus() {
    if (!isInitialCheckDone) {
      context.read<AuthBloc>().add(CheckAuthStatus());
      isInitialCheckDone = true;
    }
  }

  bool get isAuthenticated {
    final state = context.read<AuthBloc>().state;
    print("Current auth state: $state");
    return state is AuthAuthenticated;
  }
}

GoRouter getRouter(BuildContext context) {
  final authGuard = AuthGuard(context);
  final prefsManager = PreferencesManager();

  return GoRouter(
    initialLocation: '/onboard',
    refreshListenable: authGuard,
    redirect: (context, state) async {
      final isAuthenticated = authGuard.isAuthenticated;
      print("Authentication status: $isAuthenticated");
      final isLoggingIn = state.matchedLocation == '/login';
      final isSigningUp = state.matchedLocation == '/signup';
      final isOnboarding = state.matchedLocation == '/onboard';

      final hasCompletedOnboarding =
          await prefsManager.hasCompletedOnboarding();

      // First check: If user hasn't completed onboarding,
      // they should stay on onboarding screen regardless of other conditions
      if (!hasCompletedOnboarding) {
        return isOnboarding ? null : '/onboard';
      }

      // Now handle authenticated/unauthenticated states for users who completed onboarding
      if (!isAuthenticated) {
        if (isLoggingIn || isSigningUp) return null;
        return isLoggingIn ? null : '/login';
      }

      // User is authenticated and has completed onboarding
      if (isLoggingIn || isOnboarding || isSigningUp) {
        return '/home'; // Redirect to home if they try to go back to login or onboarding
      }

      if (!isAuthenticated && !isLoggingIn) return '/login';
      if (isAuthenticated && isLoggingIn) return '/home';

      return null;
    },
    routes: [
      GoRoute(path: '/onboard', builder: (context, state) => Onboarding()),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(
        path: '/productlist',
        builder: (context, state) => ProductListScreen(),
      ),
      GoRoute(
        path: '/product',
        builder: (context, state) {
          final source = state.uri.queryParameters['source'] ?? 'productlist';
          return ProductScreen(source: source);
        },
      ),
      GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
      //Account Page
      GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
      GoRoute(path: '/address', builder: (context, state) => AddressScreen()),
      GoRoute(
        path: '/add-address',
        builder: (context, state) => AddAddressScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(path: '/security', builder: (context, state) => SecurityScreen()),
      GoRoute(
        path: '/privacy-policy',
        builder: (context, state) => PrivacyPolicyScreen(),
      ),
      ShellRoute(
        routes: [
          GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
          GoRoute(
            path: '/account',
            builder: (context, state) => AccountScreen(),
          ),
          GoRoute(path: '/cart', builder: (context, state) => CartScreen()),
          GoRoute(
            path: '/category',
            builder: (context, state) => CategoryScreen(),
          ),
        ],
        builder: (context, state, child) => ShellScreen(child: child),
      ),
    ],
  );
}
