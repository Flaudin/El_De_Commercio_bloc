// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:tracking_app/data/model/product_model.dart';
import 'package:tracking_app/utils/constants.dart';

class ProductScreen extends StatefulWidget {
  final String productName;
  final String imageUrl;
  final bool initialFavorite;
  final double rating;
  final int soldCount;
  final double price;
  final Function(bool)? onFavoriteChanged;
  final String description;
  final String source;
  final ProductModel product;

  const ProductScreen({
    super.key,
    this.productName = 'Sample Product',
    this.imageUrl = '',
    this.initialFavorite = false,
    this.rating = 4.8,
    this.soldCount = 3589,
    this.price = 126.99,
    this.onFavoriteChanged,
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consectetur adipiscing elit.',
    required this.source,
    required this.product,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late bool isFavorite;
  int quantity = 1;

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

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBGPrimaryColor,
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: () {
            switch (widget.source) {
              case 'home':
                context.go('/home');
                break;
              case 'cart':
                context.go('/cart');
                break;
              case 'favorites':
                // Assuming favorites is inside your account screen
                context.go('/account');
                break;
              case 'productlist':
              default:
                context.go('/productlist');
                break;
            }
          },
          icon: Icon(Icons.arrow_back, color: kGrayColor),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(color: kLightBlue3Color),
          ),
          SizedBox(height: 14.h),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 160.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                widget.product.productName.isEmpty
                                    ? widget.productName
                                    : widget.product.productName,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kBlackColor,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Row(
                              children: [
                                SmoothStarRating(
                                  allowHalfRating: false,
                                  starCount: 5,
                                  rating:
                                      widget.product.rating <= 0
                                          ? widget.rating
                                          : widget.product.rating,
                                  size: 20.sp,
                                  color: kPrimaryColor,
                                  borderColor: kPrimaryColor,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  widget.product.rating <= 0
                                      ? widget.rating.toString()
                                      : widget.product.rating.toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kGrayColor,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                VerticalDivider(
                                  color: kGrayColor,
                                  width: 5.sp,
                                  thickness: 1.sp,
                                ),
                                Text(
                                  '(${widget.product.soldCount <= 0 ? widget.soldCount : widget.product.soldCount} sold)',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kGrayColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kPrimaryColor),
                          ),
                          child: IconButton(
                            onPressed: _toggleFavorite,
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: lg,
                            fontWeight: FontWeight.w900,
                            color: kGrayColor,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text:
                                widget.product.description.isEmpty
                                    ? widget.description
                                    : widget.product.description,
                          ),
                          style: TextStyle(fontSize: ml, color: kGreyColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: kBGPrimaryColor,
        height: 160.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(fontSize: lg, color: kGreyColor),
                    ),
                    Text(
                      '\$${widget.product.price <= 0 ? widget.price.toStringAsFixed(2) : widget.product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Decrement button
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(Icons.remove, color: Colors.grey),
                      ),
                    ),

                    // Quantity display
                    Container(
                      width: 50.w,
                      height: 36.h,
                      alignment: Alignment.center,
                      child: Text(
                        '$quantity',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    // Increment button
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(Icons.add, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Add to Cart button
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined, color: Colors.white),
                    SizedBox(width: 8.w),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
