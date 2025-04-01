import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_app/utils/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.icons, required this.title});

  final Icon icons;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: GoogleFonts.poppins(
              fontSize: ml,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
