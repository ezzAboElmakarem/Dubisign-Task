import 'package:dubisign_task_clean_arch/core/utils/app_cached_image.dart';

import '../utils/assets.dart';
import '../utils/colors_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardImageSection extends StatelessWidget {
  const CardImageSection({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: AppCashedImage(
            imageUrl: imageUrl,
            height: 180.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            backgroundColor: ColorsStyles.whiteColor.withOpacity(0.8),
            radius: 18,
            child: SvgPicture.asset(
              AssetsData.heartIcon,
              height: 30.h,
              width: 30.w,
            ),
          ),
        ),
        // Bottom Icon
        Positioned(
          bottom: -29,
          left: 0,
          right: 0,
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(AssetsData.whiteCircleBacground),
                Positioned(
                  bottom: 4,
                  right: 6,
                  left: 6,
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsStyles.blackColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset(
                        AssetsData.cartIcon,
                        colorFilter: const ColorFilter.mode(
                            ColorsStyles.whiteColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
