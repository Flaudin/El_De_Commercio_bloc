// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_bloc.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_event.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_state.dart';
import 'package:tracking_app/components/widget/filter_sheet.dart';
import 'package:tracking_app/components/widget/product_card.dart';
import 'package:tracking_app/components/utils/constants.dart';

class ProductListScreen extends StatefulWidget {
  final String source;
  final int brandId;
  String? categoryId;
  ProductListScreen({
    super.key,
    required this.source,
    required this.brandId,
    required this.categoryId,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    // Access the provided BrandBloc and trigger the fetch event
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductBloc>().add(FetchProductsByBrand(widget.brandId));
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          print("This is the source ${widget.source}");
          switch (widget.source) {
            case 'home':
              context.go('/home');
              break;
            case 'brands':
              context.go('/brand',);
              break;
          }
        }
      },
      child: Scaffold(
        backgroundColor: kBGPrimaryColor,
        appBar: AppBar(
          backgroundColor: kBGPrimaryColor,
          automaticallyImplyLeading: false,
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
                    builder: (context) =>  FilterBottomSheet(selectedCategory: widget.brandId.toString(),),
                  );
                },
                icon: Icon(Icons.filter_list, color: kLightBlue3Color),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading || state is ProductInitial) {
              return SizedBox(
                height: 150.h, // Set a fixed height for the loading indicator
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (state is ProductError) {
              return SizedBox(
                height: 150.h,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Error: ${state.message}'),
                      SizedBox(height: 8.h),
                      ElevatedButton(
                        onPressed: () {
                          // Retry fetching brands
                          context.read<ProductBloc>().add(RefreshProducts());
                        },
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is ProductLoaded) {
              final products = state.product;
              if (products.isEmpty) {
                return SizedBox(
                  height: 150.h,
                  child: Center(child: Text('No Popular brands available')),
                );
              }
              return ResponsiveGridList(
                minItemWidth: 124.w,
                horizontalGridMargin: 18.w,
                verticalGridMargin: 12.h,
                children: List.generate(
                  products.length,
                  (index) => ProductCard(
                    source: 'productlist',
                    product: products[index],
                  ),
                ),
              );
            }
            return SizedBox(
              height: 150.h,
              child: Center(child: Text('No products available')),
            );
          },
        ),
      ),
    );
  }
}
