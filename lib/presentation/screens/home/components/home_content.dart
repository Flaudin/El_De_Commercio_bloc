import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_bloc.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_event.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_state.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_bloc.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_event.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_state.dart';
import 'package:tracking_app/components/utils/app_strings.dart';
import 'package:tracking_app/components/utils/app_styles.dart';
import 'package:tracking_app/components/widget/popular_card.dart';
import 'package:tracking_app/components/widget/product_card.dart';
import 'package:tracking_app/components/utils/constants.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();
    // Access the provided BrandBloc and trigger the fetch event
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandBloc>().add(FetchBrandsByPopular());
      context.read<ProductBloc>().add(FetchProductsByPopular());
    });
  }

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.titleDescription,
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.bodySmallMedium.copyWith(
                            fontSize: 18.sp,
                            color: kTextColorPrimary,
                          ),
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
                AppStrings.newestProducts,
                style: AppStyles.titleLarge.copyWith( fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                AppStrings.information,
                style: AppStyles.bodyMediumMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              // No need to trigger FetchBrands here as we're doing it in initState
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
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 16.w,
                    children: List.generate(products.length, (index) {
                      return SizedBox(
                        width: 170.w,
                        child: ProductCard(
                          source: 'home',
                          product: products[index],
                        ),
                      );
                    }),
                  ),
                );
              }

              return SizedBox(
                height: 150.h,
                child: Center(child: Text('No data available')),
              );
            },
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
                AppStrings.popularBrands,
                style: AppStyles.titleLarge.copyWith( fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                AppStrings.information,
                style: AppStyles.bodyMediumMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          BlocBuilder<BrandBloc, BrandState>(
            builder: (context, state) {
              // No need to trigger FetchBrands here as we're doing it in initState
              if (state is BrandLoading || state is BrandInitial) {
                return SizedBox(
                  height: 150.h, // Set a fixed height for the loading indicator
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is BrandError) {
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
                            context.read<BrandBloc>().add(RefreshBrands());
                          },
                          child: Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (state is BrandLoaded) {
                final brands = state.brands;
                if (brands.isEmpty) {
                  return SizedBox(
                    height: 150.h,
                    child: Center(child: Text('No Popular brands available')),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(brands.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: PopularCard(brand: brands[index]),
                      );
                    }),
                  ),
                );
              }

              return SizedBox(
                height: 150.h,
                child: Center(child: Text('No data available')),
              );
            },
          ),
        ],
      ),
    );
  }
}
