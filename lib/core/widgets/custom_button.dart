import '../utils/colors_styles.dart';
import '../utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.textColor,
    required this.onTap,
    this.width,
    this.height,
    this.buttonColor,
    this.borderColor,
    this.textStyle,
  });
  final String buttonText;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? borderColor;
  final Color? buttonColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 60.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: buttonColor ?? kPrimaryColor,
          border:
              Border.all(color: borderColor ?? buttonColor ?? kPrimaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(buttonText,
              style: textStyle ??
                  AppStyles.styleRegular12()
                      .copyWith(color: textColor ?? ColorsStyles.whiteColor)),
        ),
      ),
    );
  }
}
