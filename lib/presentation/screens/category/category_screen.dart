import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:tracking_app/data/model/category_model.dart';
import 'package:tracking_app/presentation/screens/category/components/category_card.dart';
import 'package:tracking_app/utils/constants.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categories = CategoryData.sampleCategory();
  @override
  Widget build(BuildContext context) {
    TextEditingController searchText = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80.h,
        titleSpacing: 12.w,
        title: TextFormField(
          controller: searchText,
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
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.local_fire_department_outlined,
                color: kLightBlueColor,
              ),
            ),
          ),
        ],
      ),
      body: ResponsiveGridList(
        minItemWidth: 124.w,
        horizontalGridMargin: 24.w,
        verticalGridMargin: 12.h,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icons: categories[index].icons,
            title: categories[index].title,
          ),
        ),
      ),
    );
  }
}
