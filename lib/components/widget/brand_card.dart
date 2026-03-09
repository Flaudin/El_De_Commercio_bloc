// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/components/utils/app_styles.dart';
import 'package:tracking_app/components/utils/constants.dart';
import 'package:tracking_app/components/utils/image_helper.dart';

class BrandCard extends StatelessWidget {
  String brandId;
  String? brandName;
  String? logoUrl; 
  int? categoryId;
  BrandCard({super.key, required this.brandId, this.brandName, this.logoUrl, this.categoryId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/productlist',
          extra: {'source': "brands", 'brandname': int.parse(brandId), 'categoryId': categoryId},
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: kBorderPrimaryColor, width: 1.5.sp),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            logoUrl!.isNotEmpty
                ? img(logoUrl)
                : Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Icon(Icons.image, size: 50, color: Colors.white),
                ),
            SizedBox(height: 8),
            Text(
              brandName ?? 'Unknown Brand',
              style: AppStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}


