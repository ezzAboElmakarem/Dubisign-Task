import '../utils/colors_styles.dart';
import '../utils/routes.dart';
import '../utils/text_styles.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  String message, {
  bool errorMessage = false,
  duration = 5,
  Color color = kPrimaryColor,
  SnackBarAction? action,
}) {
  if (message.trim().isEmpty) {
    return;
  }
  ScaffoldMessenger.of(RouteUtils.context).hideCurrentSnackBar();
  ScaffoldMessenger.of(RouteUtils.context).showSnackBar(
    SnackBar(
      backgroundColor: errorMessage ? ColorsStyles.redColor : color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      content: Text(
        message,
        style:
            AppStyles.styleRegular14().copyWith(color: ColorsStyles.whiteColor),
      ),
      action: action ??
          SnackBarAction(
            label: '',
            onPressed: () {},
          ),
      duration: Duration(seconds: duration),
    ),
  );
}
