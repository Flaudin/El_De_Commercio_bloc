import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/data/model/brand_model.dart';
import 'package:tracking_app/utils/constants.dart';

class PopularCard extends StatelessWidget {
  final BrandModel brand;

  const PopularCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/productlist',
          extra: {'source': "home", 'brandname': brand.brandId},
        );
      },
      child: Container(
        width: 260.w,
        height: 140.h,
        decoration: BoxDecoration(
          //color: Color(0xFFEFEFEF),
          border: Border.all(color: kBorderPrimaryColor),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    brand.brandName,
                    style: TextStyle(fontSize: ml, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: ml, color: kGreyColor),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(
                      fontSize: ml,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
