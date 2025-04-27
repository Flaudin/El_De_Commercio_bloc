import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:tracking_app/blocs/CategoryBLoC/category_bloc.dart';
import 'package:tracking_app/blocs/CategoryBLoC/category_event.dart';
import 'package:tracking_app/blocs/CategoryBLoC/category_state.dart';
import 'package:tracking_app/presentation/screens/category/components/category_card.dart';
import 'package:tracking_app/utils/constants.dart';
import 'package:tracking_app/utils/icon_helper.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<CategoryBloc>().add(FetchCategories());
  }

  @override
  void dispose() {
    searchText.dispose();
    super.dispose();
  }

  //final categories = CategoryData.sampleCategory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 80.h,
        titleSpacing: 12.w,
        title: TextFormField(
          controller: searchText,
          onChanged: (value) {
            context.read<CategoryBloc>().add(SearchCategories(value));
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
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial) {
            return Center(child: Text('Please wait...'));
          } else if (state is CategoryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CategoryLoaded) {
            final categories = state.categories;

            if (categories.isEmpty) {
              return Center(child: Text('No categories found'));
            }
            return ResponsiveGridList(
              minItemWidth: 124.w,
              horizontalGridMargin: 24.w,
              verticalGridMargin: 12.h,
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                  icons: Icon(getIcon(categories[index].iconsName.toString())),
                  title: categories[index].title,
                ),
              ),
            );
          } else if (state is CategoryError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'android/assets/lottie/no-results-found.json',
                  ),
                  Text('No results found.'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CategoryBloc>().add(FetchCategories());
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          return Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
