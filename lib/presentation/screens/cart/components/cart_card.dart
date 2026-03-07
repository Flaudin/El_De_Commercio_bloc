import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/components/utils/constants.dart';

class CartCard extends StatelessWidget {
  final String productName;
  final String? color;
  final String? size;
  final double price;
  final int quantity;
  final Function() onDelete;
  final Function() onDecrement;
  final Function() onIncrement;
  final String? imageUrl;
  const CartCard({
    super.key,
    this.productName = "Product Name",
    this.color,
    this.size,
    this.price = 99.99,
    this.quantity = 1,
    required this.onDelete,
    required this.onDecrement,
    required this.onIncrement,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kTextColorPrimary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: kBorderPrimaryColor, width: 1.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          //Product image container
          Container(
            height: 90.h,
            width: 90.w,
            decoration: BoxDecoration(
              color: kBGSecondaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child:
                imageUrl != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(imageUrl!, fit: BoxFit.cover),
                    )
                    : null,
          ),
          SizedBox(width: 16.w),
          //Product details column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        style: TextStyle(
                          fontSize: ml,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                        size: 22.sp,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
                if (color != null || size != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Row(
                      children: [
                        if (color != null)
                          Row(
                            children: [
                              Container(
                                width: 12.w,
                                height: 12.w,
                                decoration: BoxDecoration(
                                  color: _getColorFromString(color!),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                color!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        if (color != null && size != null)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              "•",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        if (size != null)
                          Text(
                            "Size • $size",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                      ],
                    ),
                  ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(
                          0xFFFF9500,
                        ), // Orange price color from reference
                      ),
                    ),
                    Container(
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        children: [
                          _buildQuantityButton(
                            icon: Icons.remove,
                            onPressed: onDecrement,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              "$quantity",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          _buildQuantityButton(
                            icon: Icons.add,
                            onPressed: onIncrement,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required Function() onPressed,
  }) {
    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: kBGSecondaryColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 16.sp),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
      ),
    );
  }

  Color _getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'pink':
        return Colors.pink;
      case 'black':
        return Colors.black;
      default:
        return Colors.grey;
    }
  }
}
