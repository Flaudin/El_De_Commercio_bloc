import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/presentation/widget/popular_card.dart';
import 'package:tracking_app/presentation/widget/product_card.dart';
import 'package:tracking_app/utils/constants.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28.r),
                  bottomRight: Radius.circular(28.r),
                ),
              ),
              height: 260.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lorem ipsum',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: kTextColorPrimary,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'dolor sit ',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: kTextColorPrimary,
                            ),
                          ),
                          Text(
                            'amet',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: kTextColorPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        'See more >',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ml,
                          color: kTextColorPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            popularBrands(),
            SizedBox(height: 24.h),
            newestProducts(),
          ],
        ),
      ),
    );
  }

  Container newestProducts() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Newest Products',
                style: TextStyle(fontSize: ml, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                'See more >',
                style: TextStyle(
                  fontSize: sm,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return ProductCard();
              }),
            ),
          ),
        ],
      ),
    );
  }

  Container popularBrands() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Popular',
                style: TextStyle(fontSize: ml, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                'See more >',
                style: TextStyle(
                  fontSize: sm,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 16.w,
              children: List.generate(3, (index) {
                return PopularCard();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
