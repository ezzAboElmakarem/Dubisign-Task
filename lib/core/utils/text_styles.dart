import 'colors_styles.dart';
import 'responsive_fontsize.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleRegular10() {
    return TextStyle(
      color: ColorsStyles.hintColor,
      fontSize: getResponsiveFontSize(fontSize: 10),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold12() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular12() {
    return TextStyle(
      color: ColorsStyles.hintColor,
      fontSize: getResponsiveFontSize(fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold14() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold14() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleLight10() {
    return TextStyle(
      color: ColorsStyles.whiteColor,
      fontSize: getResponsiveFontSize(fontSize: 10),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleMedium10() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 10),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleLight14() {
    return TextStyle(
      color: ColorsStyles.lightBlackColor,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleMedium14() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegular16() {
    return TextStyle(
      color: ColorsStyles.lightBlackColor,
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleLight16() {
    return TextStyle(
      color: ColorsStyles.lightBlackColor,
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle styleMedium16() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleMedium18() {
    return TextStyle(
      color: ColorsStyles.goldColor,
      fontSize: getResponsiveFontSize(fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold18() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleMedium20() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold20() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold20() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular22() {
    return TextStyle(
      color: ColorsStyles.lightBlackColor,
      fontSize: getResponsiveFontSize(fontSize: 22),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold22() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 22),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium24() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold24() {
    return TextStyle(
      color: ColorsStyles.blackColor,
      fontSize: getResponsiveFontSize(fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle stylebold24() {
    return TextStyle(
      color: ColorsStyles.goldColor,
      fontSize: getResponsiveFontSize(fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }
}
