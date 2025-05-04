import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_bloc.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_bloc.dart';
import 'package:tracking_app/blocs/CategoryBLoC/category_bloc.dart';
import 'package:tracking_app/blocs/OnboardingBLoC/onboarding_bloc.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_bloc.dart';
import 'package:tracking_app/data/repositories/authentucation_repository.dart';
import 'package:tracking_app/data/repositories/brand_repository.dart';
import 'package:tracking_app/data/repositories/category_repository.dart';
import 'package:tracking_app/data/repositories/product_repository.dart';
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
    final categoryRepository = CategoryRepository();
    final brandRepository = BrandRepository();
    final productRepository = ProductRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(categoryRepository),
        ),
        BlocProvider(create: (context) => BrandBloc(brandRepository)),
        BlocProvider(create: (context) => ProductBloc(productRepository)),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: getRouter(context),
            theme: ThemeData(
              textTheme: GoogleFonts.interTextTheme(
                Theme.of(context).textTheme,
              ),
              primaryTextTheme: GoogleFonts.interTextTheme(
                Theme.of(context).primaryTextTheme,
              ),
              appBarTheme: AppBarTheme(
                titleTextStyle: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
