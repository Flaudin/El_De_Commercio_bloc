import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DateTime? selectedBirthdate;
  String countryCode = '+63';

  Future<void> selectBday(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedBirthdate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2099),
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: ColorScheme.light(primary: kPrimaryColor)),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedBirthdate) {
      setState(() {
        selectedBirthdate = picked;
        birthdateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

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
          'Edit Profile',
          style: TextStyle(fontSize: xl, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              TextFormField(
                controller: fullnameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBGSecondaryColor,
                  labelText: 'Full Name',
                  hintText: 'Ex. Juan Dela Cruz',
                  labelStyle: TextStyle(color: kGreyColor, fontSize: 16),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: kBorderPrimaryColor),
                    gapPadding: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: kBorderPrimaryColor),
                    gapPadding: 8,
                  ),
                ),
                style: TextStyle(color: kTextColorSecondary),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 30.h),
              TextFormField(
                controller: birthdateController,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBGSecondaryColor,
                  labelText: 'Birthday',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: kGreyColor,
                    onPressed: () => selectBday(context),
                  ),
                  labelStyle: TextStyle(color: kGreyColor, fontSize: 16),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: kBorderPrimaryColor),
                    gapPadding: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: kBorderPrimaryColor),
                    gapPadding: 8,
                  ),
                ),
                style: TextStyle(color: kTextColorSecondary),
                textInputAction: TextInputAction.next,
                onTap: () => selectBday(context),
              ),
              SizedBox(height: 30.h),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBGSecondaryColor,
                  labelText: 'Email',
                  hintText: 'Ex. juandelacruz@email.com',
                  suffixIcon: Icon(Icons.email_outlined),
                  suffixIconColor: kGreyColor,
                  labelStyle: TextStyle(color: kGreyColor, fontSize: 16),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: kBorderPrimaryColor),
                    gapPadding: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: kBorderPrimaryColor),
                    gapPadding: 8,
                  ),
                ),
                style: TextStyle(color: kTextColorSecondary),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 30.h),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBGSecondaryColor,
                  prefixIcon: SizedBox(
                    width: 80.w,
                    child: CountryCodePicker(
                      initialSelection: 'PH',
                      onChanged: (CountryCode code) {
                        setState(() {
                          countryCode = code.dialCode!;
                        });
                      },
                      favorite: ['PH', 'US'],
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      showDropDownButton: true,
                      hideMainText: true,
                      hideSearch: true,
                      hideCloseIcon: true,
                      alignLeft: false,
                      flagDecoration: BoxDecoration(shape: BoxShape.circle),
                      flagWidth: 32.sp,
                      headerTextStyle: TextStyle(fontSize: lg),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  suffixIcon: Icon(Icons.phone_outlined),
                  suffixIconColor: kGreyColor,
                  labelText: 'Phone',
                  hintText: countryCode,
                  labelStyle: TextStyle(color: kGreyColor, fontSize: 16),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: kBorderPrimaryColor),
                    gapPadding: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: kBorderPrimaryColor),
                    gapPadding: 8,
                  ),
                ),
                style: TextStyle(color: kTextColorSecondary),
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
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
          child: Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: kPrimaryColor,
            ),
            child: Center(
              child: Text(
                "Update",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: kTextColorPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
