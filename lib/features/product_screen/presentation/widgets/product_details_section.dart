import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/routes.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:dubisign_task_clean_arch/features/cart/presentation/views/cart_view.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsSection extends StatelessWidget {
  final ProductEntity? productModel;
  const ProductDetailsSection({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160.w,
                      child: Text(
                        productModel?.productName ?? "title",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppStyles.styleRegular14().copyWith(
                          color: const Color(0xff4F5663),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '\$${productModel?.productPrice ?? 'dummy price'}',
                      // '\$44',
                      style: AppStyles.styleSemiBold24().copyWith(
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    RouteUtils.navigateTo(const CartView());
                  },
                  child: Container(
                    height: 52.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kPrimaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
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
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Text(
              productModel?.productDescription ??
                  "Introducing the UltraComfort Wireless Headphones, designed for superior sound quality and all-day comfort. Featuring advanced noise cancellation, these headphones let you enjoy your favorite music, podcasts, or calls without any distractions. With up to 30 hours of battery life, you can stay connected wherever you go. The sleek, lightweight design ensures a snug fit, while the touch controls make it easy to adjust volume, switch tracks, or answer calls with a simple tap. Compatible with iOS and Android, these headphones offer seamless Bluetooth connectivity. Elevate your listening experience today!",
              style: AppStyles.styleRegular14(),
            ),
          ],
        ),
      ),
    );
  }
}
