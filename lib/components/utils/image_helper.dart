import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget img(String? base64String) {
  if (base64String == null) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey,
      child: Icon(Icons.image, size: 50, color: Colors.white),
    );
  } else {
    try {
      print('Original base64 string: $base64String');
      String clean =
          base64String.contains(',')
              ? base64String.split(',').last
              : base64String;

      bool isSvg = base64String.contains('svg');

      if (isSvg) {
        String svgString = utf8.decode(base64Decode(clean));
        return SizedBox(
          width: 100.w,
          height: 100.h,
          child: SvgPicture.string(
            svgString,
            placeholderBuilder: (context) => Icon(Icons.image),
          ),
        );
      } else {
        return Image.memory(
          base64Decode(clean),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image);
          },
        );
      }
    } catch (e) {
      return Container(
        width: 100,
        height: 100,
        color: Colors.grey,
        child: Icon(Icons.broken_image, size: 50, color: Colors.white),
      );
    }
  }
}