import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/components/utils/constants.dart';

class AddressCard extends StatefulWidget {
  final String titleAddress;
  final String address;
  final bool isDefault;
  final Function ontap;
  const AddressCard({
    super.key,
    required this.titleAddress,
    required this.address,
    required this.isDefault,
    required this.ontap,
  });

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kInfoColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              child: Icon(Icons.location_on_outlined, color: kWhiteColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.titleAddress,
                      style: TextStyle(
                        fontSize: lg,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    widget.isDefault
                        ? Container(
                          decoration: BoxDecoration(
                            color: kBGSecondaryColor,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 4.h,
                          ),
                          child: Text(
                            'Default',
                            style: TextStyle(
                              fontSize: sm,
                              fontWeight: FontWeight.bold,
                              color: kSuccessColor,
                            ),
                          ),
                        )
                        : SizedBox.shrink(),
                  ],
                ),
                Text(
                  widget.address,
                  style: TextStyle(fontSize: ml, color: kGreyColor),
                ),
              ],
            ),
            Icon(Icons.edit_outlined, color: kPrimaryColor),
          ],
        ),
      ),
    );
  }
}
