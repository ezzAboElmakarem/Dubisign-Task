import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertBanner extends StatelessWidget {
  const AdvertBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsStyles.lightGreyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Ensures proper spacing
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shop with us!",
                  style: AppStyles.styleRegular16(),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 166.w,
                  child: Text(
                    "Get 40% Off for all items",
                    style: AppStyles.styleBold22(),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      "Shop Now",
                      style: AppStyles.styleBold14().copyWith(fontSize: 16),
                    ),
                    SizedBox(width: 6.w),
                    const Icon(
                      Icons.arrow_forward,
                      color: ColorsStyles.blackColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 100.w,
            height: 160.h,
            child: Image.asset(
              AssetsData.advertPic,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
