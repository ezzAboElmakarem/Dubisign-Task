import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/routes.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/product_screen/presentation/widgets/product_image_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwipeUpSection extends StatelessWidget {
  final ProductEntity? productModel;

  const SwipeUpSection({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // product image
        ProductImageSwiper(
          productModel: productModel,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  RouteUtils.pop();
                },
                child: CircleAvatar(
                  backgroundColor: ColorsStyles.whiteColor.withOpacity(0.8),
                  radius: 18,
                  child: SvgPicture.asset(
                    AssetsData.backArrowIcon,
                    colorFilter: const ColorFilter.mode(
                        ColorsStyles.blackColor, BlendMode.srcIn),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: CircleAvatar(
                  backgroundColor: ColorsStyles.shadowColor.withOpacity(0.8),
                  radius: 22,
                  child: SvgPicture.asset(
                    AssetsData.heartIcon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: CircleAvatar(
                  backgroundColor: ColorsStyles.shadowColor.withOpacity(0.8),
                  radius: 22,
                  child: SvgPicture.asset(
                    AssetsData.cartIcon,
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
