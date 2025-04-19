import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_bloc.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_event.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_state.dart';
import 'package:tracking_app/utils/constants.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  logout() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: SizedBox(),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Logout',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text('Are you sure you want to logout?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: kErrorColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutRequest());
                  context.go('/login');
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: kTextColorPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          context.go('/login');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(
              fontSize: lg,
              color: kTextColorSecondary,
            ),
          ),
          actionsPadding: EdgeInsets.symmetric(horizontal: 12.w),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              accountDetails(),
              SizedBox(height: 24.h),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(1, 2), // changes position of shadow
                    ),
                  ],
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                height: 520.h,
                width: 360.w,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    accountOption(
                      Icons.person_outline,
                      'Edit Profile',
                      kLightBlueColor,
                      () {},
                    ),
                    accountOption(
                      Icons.location_on_outlined,
                      'Address',
                      kLightBlueColor,
                      () {},
                    ),
                    accountOption(
                      Icons.notifications_none_outlined,
                      'Notification',
                      kLightBlueColor,
                      () {},
                    ),
                    accountOption(
                      Icons.security_outlined,
                      'Security',
                      kLightBlueColor,
                      () {},
                    ),
                    accountOption(
                      Icons.policy_outlined,
                      'Privacy Policy',
                      kLightBlueColor,
                      () {},
                    ),
                    accountOption(
                      Icons.exit_to_app_outlined,
                      'Log out',
                      kErrorColor,
                      () {
                        logout();
                      },
                      forlogout: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountOption(
    IconData icon,
    String text,
    Color color,
    VoidCallback onTap, {
    bool forlogout = false,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Icon(icon, color: forlogout ? kErrorColor : kLightBlueColor),
                SizedBox(width: 12.w),
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: ml,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
                const Spacer(),
                forlogout ? SizedBox.shrink() : const Icon(Icons.navigate_next),
              ],
            ),
          ),
        ),
        forlogout ? SizedBox.shrink() : const Divider(),
      ],
    );
  }

  Row accountDetails() {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreyColor,
              ),
              width: 80.w,
              height: 80.h,
            ),
            Positioned(
              bottom: 0,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.edit, color: kTextColorPrimary, size: 18.sp),
              ),
            ),
          ],
        ),
        SizedBox(width: 18.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Name',
              style: GoogleFonts.poppins(
                fontSize: lg,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Contact No.',
              style: GoogleFonts.poppins(
                fontSize: ml,
                color: kGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
