import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/components/utils/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icons,
    required this.title,
    required this.categoryId,
  });
  final String categoryId;
  final Icon icons;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/brand", extra: {'categoryId': categoryId});
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kBorderPrimaryColor, width: 1.5.sp),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icons,
            Text(
              title,
              style: TextStyle(fontSize: ml - .5, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
