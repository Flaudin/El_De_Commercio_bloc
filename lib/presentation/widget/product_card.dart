// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:tracking_app/utils/constants.dart';

class ProductCard extends StatefulWidget {
  final String productName;
  final String imageUrl;
  final bool initialFavorite;
  final double rating;
  final int soldCount;
  final double price;
  final Function(bool)? onFavoriteChanged;

  const ProductCard({
    super.key,
    this.productName = 'Sample Product',
    this.imageUrl = '',
    this.initialFavorite = false,
    this.rating = 4.8,
    this.soldCount = 3589,
    this.price = 126.99,
    this.onFavoriteChanged,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (widget.onFavoriteChanged != null) {
      widget.onFavoriteChanged!(isFavorite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/product');
      },
      child: SizedBox(
        width: 220.w,
        height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Product image container
                Container(
                  decoration: BoxDecoration(
                    color: kBorderPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 160.w,
                  width: 220.h,
                  child:
                      widget.imageUrl.isNotEmpty
                          ? Image.network(widget.imageUrl, fit: BoxFit.cover)
                          : null,
                ),
                // Favorite icon
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFavorite ? kPrimaryColor : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: _toggleFavorite,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        color: isFavorite ? Colors.white : kPrimaryColor,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              widget.productName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                SmoothStarRating(
                  rating: widget.rating,
                  size: 16.sp,
                  color: kWarningColor,
                  borderColor: kWarningColor,
                  allowHalfRating: true,
                  halfFilledIconData: Icons.star_half,
                  starCount: 1,
                ),
                SizedBox(width: 4),
                Text(
                  widget.rating.toString(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: kGrayColor,
                  ),
                ),
                SizedBox(width: 4),
                VerticalDivider(color: kGrayColor, width: 1.w, thickness: 1.sp),
                SizedBox(width: 4),
                Container(
                  decoration: BoxDecoration(
                    color: kBorderPrimaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Text(
                    '${widget.soldCount} sold',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kGrayColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              '\$${widget.price}',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
