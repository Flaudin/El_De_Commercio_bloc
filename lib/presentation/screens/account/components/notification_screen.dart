import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/presentation/widget/notification_card.dart';
import 'package:tracking_app/utils/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          'Notifications',
          style: TextStyle(fontSize: xl, fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(children: [SizedBox(height: 30.h), NotificationCard()]),
      ),
    );
  }
}
