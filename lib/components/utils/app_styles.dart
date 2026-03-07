import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  AppStyles._();

  static TextStyle baseStyle = GoogleFonts.poppins();

  // Base text style with Poppins font
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Heading Styles
  static TextStyle get heading1 => baseStyle.copyWith(
    fontSize: 32,
    fontWeight: bold,
    height: 1.2
  );

  static TextStyle get heading1Medium => baseStyle.copyWith(
        fontSize: 32,
        fontWeight: medium,
        height: 1.2,
      );

  static TextStyle get heading1Regular => baseStyle.copyWith(
        fontSize: 32,
        fontWeight: regular,
        height: 1.2,
      );

  static TextStyle get heading2 => baseStyle.copyWith(
        fontSize: 28,
        fontWeight: bold,
        height: 1.3,
      );

  static TextStyle get heading2SemiBold => baseStyle.copyWith(
        fontSize: 28,
        fontWeight: semiBold,
        height: 1.3,
      );

  static TextStyle get heading2Medium => baseStyle.copyWith(
        fontSize: 28,
        fontWeight: medium,
        height: 1.3,
      );

  static TextStyle get heading3 => baseStyle.copyWith(
        fontSize: 24,
        fontWeight: bold,
        height: 1.3,
      );

  static TextStyle get heading3SemiBold => baseStyle.copyWith(
        fontSize: 24,
        fontWeight: semiBold,
        height: 1.3,
      );

  static TextStyle get heading3Medium => baseStyle.copyWith(
        fontSize: 24,
        fontWeight: medium,
        height: 1.3,
      );

  static TextStyle get heading4 => baseStyle.copyWith(
        fontSize: 20,
        fontWeight: bold,
        height: 1.4,
      );

  static TextStyle get heading4SemiBold => baseStyle.copyWith(
        fontSize: 20,
        fontWeight: semiBold,
        height: 1.4,
      );

  // Title Styles
  static TextStyle get titleLarge => baseStyle.copyWith(
        fontSize: 18,
        fontWeight: semiBold,
        height: 1.4,
      );

  static TextStyle get titleMedium => baseStyle.copyWith(
        fontSize: 16,
        fontWeight: semiBold,
        height: 1.4,
      );

  static TextStyle get titleSmall => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: semiBold,
        height: 1.4,
      );

  // Body Styles
  static TextStyle get bodyLargeBold => baseStyle.copyWith(
        fontSize: 16,
        fontWeight: bold,
        height: 1.5,
      );

  static TextStyle get bodyLargeSemiBold => baseStyle.copyWith(
        fontSize: 16,
        fontWeight: semiBold,
        height: 1.5,
      );

  static TextStyle get bodyLargeMedium => baseStyle.copyWith(
        fontSize: 16,
        fontWeight: medium,
        height: 1.5,
      );

  static TextStyle get bodyLarge => baseStyle.copyWith(
        fontSize: 16,
        fontWeight: regular,
        height: 1.5,
      );

  static TextStyle get bodyMediumBold => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: bold,
        height: 1.5,
      );

  static TextStyle get bodyMediumSemiBold => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: semiBold,
        height: 1.5,
      );

  static TextStyle get bodyMediumMedium => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: medium,
        height: 1.5,
      );

  static TextStyle get bodyMedium => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: regular,
        height: 1.5,
      );

  static TextStyle get bodySmallBold => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: bold,
        height: 1.5,
      );

  static TextStyle get bodySmallSemiBold => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: semiBold,
        height: 1.5,
      );

  static TextStyle get bodySmallMedium => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: medium,
        height: 1.5,
      );

  static TextStyle get bodySmall => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: regular,
        height: 1.5,
      );

  // Subtext / Caption Styles
  static TextStyle get subtextLargeBold => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: bold,
        height: 1.4,
      );

  static TextStyle get subtextLargeSemiBold => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: semiBold,
        height: 1.4,
      );

  static TextStyle get subtextLargeMedium => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: medium,
        height: 1.4,
      );

  static TextStyle get subtextLarge => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: regular,
        height: 1.4,
      );

  static TextStyle get subtextBold => baseStyle.copyWith(
        fontSize: 10,
        fontWeight: bold,
        height: 1.4,
      );

  static TextStyle get subtextSemiBold => baseStyle.copyWith(
        fontSize: 10,
        fontWeight: semiBold,
        height: 1.4,
      );

  static TextStyle get subtextMedium => baseStyle.copyWith(
        fontSize: 10,
        fontWeight: medium,
        height: 1.4,
      );

  static TextStyle get subtext => baseStyle.copyWith(
        fontSize: 10,
        fontWeight: regular,
        height: 1.4,
      );

  // Button Styles
  static TextStyle get buttonLarge => baseStyle.copyWith(
        fontSize: 16,
        fontWeight: semiBold,
        height: 1.2,
      );

  static TextStyle get buttonMedium => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: semiBold,
        height: 1.2,
      );

  static TextStyle get buttonSmall => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: semiBold,
        height: 1.2,
      );

  // Label Styles
  static TextStyle get labelLargeBold => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: bold,
        height: 1.2,
      );

  static TextStyle get labelLargeMedium => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: medium,
        height: 1.2,
      );

  static TextStyle get labelLarge => baseStyle.copyWith(
        fontSize: 14,
        fontWeight: regular,
        height: 1.2,
      );

  static TextStyle get labelMediumBold => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: bold,
        height: 1.2,
      );

  static TextStyle get labelMediumMedium => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: medium,
        height: 1.2,
      );

  static TextStyle get labelMedium => baseStyle.copyWith(
        fontSize: 12,
        fontWeight: regular,
        height: 1.2,
      );

  static TextStyle get labelSmallBold => baseStyle.copyWith(
        fontSize: 10,
        fontWeight: bold,
        height: 1.2,
      );

  static TextStyle get labelSmall => baseStyle.copyWith(
        fontSize: 10,
        fontWeight: regular,
        height: 1.2,
      );
}