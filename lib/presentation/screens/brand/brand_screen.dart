import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/utils/constants.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80.h,
        titleSpacing: 12.w,
        leading: GestureDetector(
          onTap: () {
            context.go('/category');
          },
          child: Icon(Icons.arrow_back, color: kLightBlueColor),
        ),
        title: TextFormField(
          controller: searchText,
          onChanged: (value) {
            //context.read<CategoryBloc>().add(SearchCategories(value));
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: kLightBlueColor),
            labelText: "Search",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kLightBlue3Color),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 12.w),
        actions: [
          Container(
            height: 58.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: kBorderPrimaryColor, width: 1.sp),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset('android/assets/images/filter-24.png'),
            ),
          ),
        ],
      ),
    );
  }
}
