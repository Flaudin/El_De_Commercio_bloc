import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // Selected filter values
  String selectedCategory = 'Nike';
  String selectedGender = 'All';
  RangeValues priceRange = const RangeValues(100, 250);
  String selectedSort = 'Popular';
  String selectedRating = '4';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Filter',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 16.h),

          // Categories Section
          Text(
            'Categories',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('All', selectedCategory == 'All'),
                SizedBox(width: 8.w),
                _buildFilterChip(
                  'Adidas',
                  selectedCategory == 'Adidas',
                  icon: 'assets/adidas_logo.png',
                ),
                SizedBox(width: 8.w),
                _buildFilterChip(
                  'Nike',
                  selectedCategory == 'Nike',
                  isSelected: true,
                ),
                SizedBox(width: 8.w),
                _buildFilterChip(
                  'Puma',
                  selectedCategory == 'Puma',
                  icon: 'assets/puma_logo.png',
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Gender Section
          Text(
            'Gender',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              _buildFilterChip(
                'All',
                selectedGender == 'All',
                isSelected: true,
              ),
              SizedBox(width: 8.w),
              _buildFilterChip('Man', selectedGender == 'Man'),
              SizedBox(width: 8.w),
              _buildFilterChip('Women', selectedGender == 'Women'),
            ],
          ),
          SizedBox(height: 16.h),

          // Price Range Section
          Text(
            'Price',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.h),
          RangeSlider(
            values: priceRange,
            min: 0,
            max: 500,
            divisions: 50,
            activeColor: Colors.orange,
            inactiveColor: Colors.orange.withOpacity(0.2),
            labels: RangeLabels(
              '\$${priceRange.start.round()}',
              '\$${priceRange.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                priceRange = values;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${priceRange.start.round()}'),
              Text('\$${priceRange.end.round()}'),
            ],
          ),
          SizedBox(height: 16.h),

          // Sort Section (looks like "Gender" is actually "Sort" in the image)
          Text(
            'Gender', // This should probably be "Sort"
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip(
                  'Popular',
                  selectedSort == 'Popular',
                  isSelected: true,
                ),
                SizedBox(width: 8.w),
                _buildFilterChip(
                  'Newest shoes',
                  selectedSort == 'Newest shoes',
                ),
                SizedBox(width: 8.w),
                _buildFilterChip('Special', selectedSort == 'Special'),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Rating Section
          Text(
            'Rating',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('All', selectedRating == 'All'),
                SizedBox(width: 8.w),
                _buildRatingChip('5', selectedRating == '5'),
                SizedBox(width: 8.w),
                _buildRatingChip('4', selectedRating == '4', isSelected: true),
                SizedBox(width: 8.w),
                _buildRatingChip('3', selectedRating == '3'),
                SizedBox(width: 8.w),
                _buildRatingChip('2', selectedRating == '2'),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Reset filters
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                  child: Text('Reset'),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Apply filters
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    backgroundColor: Colors.orange,
                  ),
                  child: Text('Apply', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  // Helper method to build filter chips
  Widget _buildFilterChip(
    String label,
    bool isActive, {
    String? icon,
    bool isSelected = false,
  }) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Image.asset(icon, height: 16.h, width: 16.w),
            SizedBox(width: 4.w),
          ],
          Text(label),
        ],
      ),
      selected: isSelected,
      selectedColor: Colors.orange,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      onSelected: (bool selected) {
        // Handle selection
      },
    );
  }

  // Helper method to build rating chips with stars
  Widget _buildRatingChip(
    String rating,
    bool isActive, {
    bool isSelected = false,
  }) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 16.r,
            color: isSelected ? Colors.white : Colors.amber,
          ),
          SizedBox(width: 4.w),
          Text(rating),
        ],
      ),
      selected: isSelected,
      selectedColor: Colors.orange,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      onSelected: (bool selected) {
        // Handle selection
      },
    );
  }
}
