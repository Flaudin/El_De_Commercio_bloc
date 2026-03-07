import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/components/utils/constants.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
          'Privacy Policy',
          style: TextStyle(fontSize: xl, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
