import '../utils/colors_styles.dart';
import '../utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? appBarHeight;
  final dynamic cubit;

  const CustomAppBar({
    super.key,
    this.appBarHeight,
    required this.context,
    this.leading,
    this.title,
    this.actions,
    this.appBarColor,
    this.iconColor,
    this.titleStyle,
    this.titleWidget,
    required this.shadow,
    this.cubit,
  });

  final BuildContext context;
  final Widget? leading;
  final Widget? titleWidget;
  final bool shadow;
  final String? title;
  final List<Widget>? actions;
  final Color? appBarColor;
  final Color? iconColor;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor ?? Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      elevation: shadow ? 6.0 : 0,
      shadowColor:
          shadow ? const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5) : null,
      foregroundColor: Colors.black,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: appBarHeight,
      leading: leading ??
          IconButton(
            onPressed: () {
              RouteUtils.pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: iconColor ?? ColorsStyles.blackColor,
              size: 34.sp,
            ),
          ),
      title: titleWidget ??
          Text(
            title ?? '',
            style: titleStyle,
          ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? kToolbarHeight);
}
