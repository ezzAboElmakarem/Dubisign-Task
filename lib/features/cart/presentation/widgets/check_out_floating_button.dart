import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutFloatingButton extends StatelessWidget {
  const CheckOutFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // RouteUtils.navigateTo(const CartView());
      },
      child: Container(
        height: 52.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: kPrimaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Checkout",
              style: AppStyles.styleSemiBold14()
                  .copyWith(color: ColorsStyles.whiteColor),
            ),
            SizedBox(
              width: 8.w,
            ),
            const Icon(
              Icons.arrow_forward,
              color: ColorsStyles.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
