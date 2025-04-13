import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_bloc.dart';
import 'package:tracking_app/blocs/OnboardingBLoC/onboarding_bloc.dart';
import 'package:tracking_app/data/repositories/authentucation_repository.dart';
import 'package:tracking_app/presentation/routes/router.dart';
import 'package:tracking_app/utils/preference_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PreferencesManager preferencesManager = PreferencesManager();
    final authRepository = AuthRepository(preferencesManager);
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: getRouter(context),
          );
        },
      ),
    );
  }
}
