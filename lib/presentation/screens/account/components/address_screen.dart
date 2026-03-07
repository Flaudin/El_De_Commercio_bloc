import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/data/model/address_model.dart';
import 'package:tracking_app/components/widget/address_card.dart';
import 'package:tracking_app/components/utils/constants.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final address = AddressData.sampleAddress();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.go('/account');
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Address',
          style: TextStyle(fontSize: xl, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            SingleChildScrollView(
              child: Column(
                children: List.generate(
                  address.length,
                  (index) => AddressCard(
                    titleAddress: address[index].title,
                    address:
                        '${address[index].streetno},${address[index].city}',
                    isDefault: address[index].isDefault,
                    ontap: () {
                      context.go('/add-address');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          color: kTextColorPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              context.go('/add-address');
            },
            child: Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: kPrimaryColor,
              ),
              child: Center(
                child: Text(
                  "Add New Address",
                  style: TextStyle(
                    fontSize: xl,
                    fontWeight: FontWeight.w500,
                    color: kTextColorPrimary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
