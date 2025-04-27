import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tracking_app/utils/constants.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
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
          'Security',
          style: TextStyle(fontSize: xl, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
