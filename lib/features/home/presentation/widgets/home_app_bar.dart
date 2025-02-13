import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/routes.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:dubisign_task_clean_arch/features/cart/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              "Welcome Back!",
              style: AppStyles.styleRegular14(),
            ),
            SizedBox(height: 3.h),
            Text(
              "Falcon Thought",
              style: AppStyles.styleSemiBold16(),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorsStyles.hintColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 13,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            child: InkWell(
              onTap: () {
                RouteUtils.navigateTo(CartView());
              },
              child: SvgPicture.asset(
                AssetsData.cartIcon,
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
        )
      ],
    );
  }
}
