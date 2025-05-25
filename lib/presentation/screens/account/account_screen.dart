import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_bloc.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_event.dart';
import 'package:tracking_app/blocs/AuthBLoC/auth_state.dart';
import 'package:tracking_app/data/model/auth_creadentials_model.dart';
import 'package:tracking_app/utils/constants.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  LoginCredentials? credentials;

  @override
  void initState() {
    super.initState();
    // Optionally, you can add an event to load the profile data here
    context.read<AuthBloc>().add(LoadProfile());
  }

  logout() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: kWhiteColor,
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

  editImage() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => AlertDialog.adaptive(
            backgroundColor: Colors.transparent,
            content: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kWhiteColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Center(
                child: Text(
                  'Upload Image',
                  style: TextStyle(fontSize: 12.sp, color: kGreyColor),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text("Cancel", style: TextStyle(color: kErrorColor)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          context.go('/login');
        }
      },
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          credentials = state.credentials;
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile',
              style: TextStyle(fontSize: xl, fontWeight: FontWeight.w800),
            ),
            actionsPadding: EdgeInsets.symmetric(horizontal: 12.w),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            ],
          ),
          body:
              state is ProfileLoading
                  ? Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  )
                  : Padding(
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
                                offset: Offset(
                                  1,
                                  2,
                                ), // changes position of shadow
                              ),
                            ],
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(18.r),
                          ),
                          height: 520.h,
                          width: 360.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 24.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              accountOption(
                                Icons.person_outline,
                                'Edit Profile',
                                kLightBlueColor,
                                () {
                                  context.go('/profile');
                                },
                              ),
                              accountOption(
                                Icons.location_on_outlined,
                                'Address',
                                kLightBlueColor,
                                () {
                                  context.go('/address');
                                },
                              ),
                              accountOption(
                                Icons.notifications_none_outlined,
                                'Notification',
                                kLightBlueColor,
                                () {
                                  context.go('/notifications');
                                },
                              ),
                              accountOption(
                                Icons.security_outlined,
                                'Security',
                                kLightBlueColor,
                                () {
                                  context.go('/security');
                                },
                              ),
                              accountOption(
                                Icons.policy_outlined,
                                'Privacy Policy',
                                kLightBlueColor,
                                () {
                                  context.go('/privacy-policy');
                                },
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
        );
      },
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
                  style: TextStyle(
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
                child: GestureDetector(
                  onTap: editImage,
                  child: Icon(
                    Icons.edit,
                    color: kTextColorPrimary,
                    size: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 18.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              credentials?.email ?? 'Account Name',
              style: TextStyle(fontSize: lg, fontWeight: FontWeight.w500),
            ),
            Text(
              credentials?.phonenumber ?? 'Contact No.',
              style: TextStyle(
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
