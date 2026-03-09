import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/components/utils/app_strings.dart';
import 'package:tracking_app/components/utils/app_styles.dart';
import 'package:tracking_app/components/utils/constants.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            toolbarHeight: 80.h,
            titleSpacing: 12.w,
            title: Row(
              spacing: 20.w,
              children: [
                GestureDetector(
                  onTap: () => context.go('/home'),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: kGreyColor,
                  ),
                ),
                Text(
                  AppStrings.favoriteProducts,
                  style: AppStyles.titleMedium.copyWith(fontSize: xl,fontWeight: FontWeight.w800),
                ),
              ],
            ),
            actionsPadding: EdgeInsets.symmetric(horizontal: 12.w),
            actions: [
              IconButton(
                onPressed: () => context.go('/search'),
                icon: const Icon(
                  Icons.search_outlined,
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
