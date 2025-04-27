import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/utils/constants.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({super.key});

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/productlist');
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
                    'Product Brand',
                    style: TextStyle(fontSize: ml, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: ml, color: kGreyColor),
                  ),
                  Text(
                    "\$132.99",
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
