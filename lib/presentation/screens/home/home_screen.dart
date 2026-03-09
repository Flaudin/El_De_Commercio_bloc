import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/presentation/screens/home/components/home_content.dart';
import 'package:tracking_app/components/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: kBGPrimaryColor,
        extendBodyBehindAppBar: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            elevation: 4.0, // Add elevation to make AppBar more stable
            scrolledUnderElevation:
                0, // Ensure elevation when content scrolls under
            shadowColor: Colors.black45, // Add shadow for better distinction
            title: Text(
              'Explore',
              style: TextStyle(
                fontSize: xl,
                fontWeight: FontWeight.w800,
                color: kWhiteColor,
              ),
            ),
            actionsPadding: EdgeInsets.symmetric(horizontal: 12.w),
            backgroundColor: kPrimaryColor,
            actions: [
              IconButton(
                onPressed: () => context.go('/search'),
                icon: const Icon(
                  Icons.search_outlined,
                  color: kTextColorPrimary,
                ),
              ),
              IconButton(
                onPressed: () => context.go('/favorites'),
                icon: const Icon(
                  Icons.favorite_outline,
                  color: kTextColorPrimary,
                ),
              ),
            ],
          ),
        ),
        body: HomeContent(),
      ),
    );
  }
}
