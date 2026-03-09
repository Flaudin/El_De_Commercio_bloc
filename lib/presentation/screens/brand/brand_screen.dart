import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_bloc.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_event.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_state.dart';
import 'package:tracking_app/components/utils/app_strings.dart';
import 'package:tracking_app/components/utils/constants.dart';
import 'package:tracking_app/components/widget/brand_card.dart';

class BrandScreen extends StatefulWidget {
  final String categoryId;
  const BrandScreen({super.key, required this.categoryId});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<BrandBloc>().add(FetchBrandsByCategory(widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80.h,
        titleSpacing: 12.w,
        leading: GestureDetector(
          onTap: () {
            context.go('/category');
          },
          child: Icon(Icons.arrow_back, color: kLightBlueColor),
        ),
        title: TextFormField(
          controller: searchText,
          onChanged: (value) {
            //context.read<CategoryBloc>().add(SearchCategories(value));
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: kLightBlueColor),
            labelText: "Search",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kLightBlue3Color),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 12.w),
        actions: [
          Container(
            height: 58.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: kBorderPrimaryColor, width: 1.sp),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset('android/assets/images/filter-24.png'),
            ),
          ),
        ],
      ),
      body: BlocBuilder<BrandBloc, BrandState>(
        builder: (context, state) {
          if (state is BrandInitial) {
            return Center(child: Text('Please wait...'));
          } else if (state is BrandLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BrandLoaded) {
            final brands = state.brands;
            print("Brands loaded: ${brands.length}");
            return brands.isEmpty? Center(child: Text('No brands found')) : 
            ResponsiveGridList(
              minItemWidth: 124.w,
              horizontalGridMargin: 24.w,
              verticalGridMargin: 12.h,
              children: List.generate(
                brands.length,
                (index) => BrandCard(
                  brandId: brands[index].brandId.toString(),
                  brandName: brands[index].brandName,
                  logoUrl: AppStrings.base64Image + brands[index].logoUrl.toString(),
                ),
              ),
            );
            // ListView.builder(
            //   itemCount: brands.length,
            //   itemBuilder: (context, index) {
            //     final brand = brands[index];
            //     print('Brands loaded: ${brand.brandName}');
            //     return ListTile(title: Text(brand.brandName));
            //   },
            // );
          }else if(state is BrandError){
            return Center(child: Text('Error loading brands: ${state.message}'));
          }
          return Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
