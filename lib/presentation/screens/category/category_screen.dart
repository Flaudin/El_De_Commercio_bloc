import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/utils/constants.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchText = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: searchText,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: "Search",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 4.w),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: kGreyColor, width: 1.5.sp),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.local_fire_department_outlined,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 12.w),child: SingleChildScrollView(child: Column(),),),
    );
  }
}
