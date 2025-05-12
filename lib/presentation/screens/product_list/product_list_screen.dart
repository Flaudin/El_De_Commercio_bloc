// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:tracking_app/data/model/product_model.dart';
import 'package:tracking_app/presentation/widget/filter_sheet.dart';
import 'package:tracking_app/presentation/widget/product_card.dart';
import 'package:tracking_app/utils/constants.dart';

class ProductListScreen extends StatefulWidget {
  final String source;
  const ProductListScreen({super.key, required this.source});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          context.go('/home');
        }
      },
      child: Scaffold(
        backgroundColor: kBGPrimaryColor,
        appBar: AppBar(
          backgroundColor: kBGPrimaryColor,
          title: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: kLightBlue3Color),
              labelText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: kBorderPrimaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: kBorderPrimaryColor),
              ),
            ),
          ),
          actionsPadding: EdgeInsets.symmetric(horizontal: 12.h),
          actions: [
            Container(
              height: 58.h,
              width: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: kBorderPrimaryColor, width: 1.sp),
              ),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const FilterBottomSheet(),
                  );
                },
                icon: Icon(Icons.filter_list, color: kLightBlue3Color),
              ),
            ),
          ],
        ),
        body: ResponsiveGridList(
          minItemWidth: 124.w,
          horizontalGridMargin: 18.w,
          verticalGridMargin: 12.h,
          children: List.generate(
            6,
            (index) => ProductCard(
              source: 'productlist',
              product: ProductModel(
                id: 1,
                productName: 'Sample Product',
                images: [''],
                isFavorite: false,
                rating: 4.8,
                soldCount: 3589,
                price: 126.99,
                description: '',
                size: '',
                hasSize: false,
                hasColor: false,
                canBeSoldBySet: false,
                isPopular: false,
                isNew: false,
                brandId: 0,
                brand: '',
                sizes: [],
                colors: [],
                sets: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
