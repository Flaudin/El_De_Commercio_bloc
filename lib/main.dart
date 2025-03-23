import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_bloc.dart';
import 'package:tracking_app/data/repositories/authentucation_repository.dart';
import 'package:tracking_app/presentation/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();
    return BlocProvider(
      create: (context) => AuthBloc(authRepository),
      child: Builder(
        builder:
            (context) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: getRouter(context),
            ),
      ),
    );
  }
}
