import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_app/presentation/widget/item_card.dart';
import 'package:tracking_app/presentation/widget/popular_card.dart';
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
              height: 160.h,
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
                style: GoogleFonts.poppins(
                  fontSize: ml,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                'See more >',
                style: GoogleFonts.poppins(
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
              spacing: 12.w,
              children: List.generate(5, (index) {
                return ItemCard();
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
                style: GoogleFonts.poppins(
                  fontSize: ml,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                'See more >',
                style: GoogleFonts.poppins(
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
