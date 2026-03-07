import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/components/utils/constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  bool agreeOnTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: kGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Fill the information below or register \nwith your social account.",
                      style: TextStyle(fontSize: ml),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50.h),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Ex. Juan Dela Cruz',
                        labelStyle: TextStyle(color: kGreyColor, fontSize: 16),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: kBorderPrimaryColor,
                          ),
                          gapPadding: 8,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: kBorderPrimaryColor,
                          ),
                          gapPadding: 8,
                        ),
                      ),
                      style: TextStyle(color: kTextColorSecondary),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: kGreyColor, fontSize: 16),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: kBorderPrimaryColor,
                          ),
                          gapPadding: 8,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: kBorderPrimaryColor,
                          ),
                          gapPadding: 8,
                        ),
                      ),
                      style: TextStyle(color: kTextColorSecondary),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: kGreyColor, fontSize: 16),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: kBorderPrimaryColor,
                          ),
                          gapPadding: 8,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: kBorderPrimaryColor,
                          ),
                          gapPadding: 8,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible
                                // ignore: dead_code
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kTextColorSecondary,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(color: kTextColorSecondary),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {},
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Checkbox(
                              value: agreeOnTerms,
                              onChanged: (bool? value) {
                                setState(() {
                                  agreeOnTerms = value!;
                                });
                              },
                              activeColor: kPrimaryColor,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    agreeOnTerms = !agreeOnTerms;
                                  });
                                },
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: kGreyColor),
                                    children: [
                                      TextSpan(text: "Agree with  "),
                                      TextSpan(
                                        text: "Terms & Condition",
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ml,
                                        ),
                                        recognizer:
                                            TapGestureRecognizer()
                                              ..onTap = () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: kTextColorPrimary),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: kGreyColor, height: 1.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or sign in with',
                            style: TextStyle(color: kGreyColor, fontSize: ml),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: kGreyColor, height: 1.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kBorderPrimaryColor),
                            ),
                            child: Image.asset(
                              'android/assets/images/apple-icon.png',
                              height: 32.h,
                              width: 32.w,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kBorderPrimaryColor),
                            ),
                            child: Image.asset(
                              'android/assets/images/google-icon.png',
                              height: 32.h,
                              width: 32.w,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kBorderPrimaryColor),
                            ),
                            child: Image.asset(
                              'android/assets/images/facebook-icon.png',
                              height: 32.h,
                              width: 32.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kGrayColor,
                            fontSize: ml,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        GestureDetector(
                          onTap: () {
                            context.go('/login');
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              fontSize: ml,
                              decoration: TextDecoration.underline,
                              decorationColor: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
