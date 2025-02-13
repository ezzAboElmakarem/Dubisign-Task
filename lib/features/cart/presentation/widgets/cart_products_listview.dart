import 'package:dubisign_task_clean_arch/core/utils/app_cached_image.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/cart_product_entity.dart';
import 'package:dubisign_task_clean_arch/features/cart/presentation/widgets/cart_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductsListView extends StatelessWidget {
  final List<CartProductEntity> userProductsList;
  const CartProductsListView({
    super.key,
    required this.userProductsList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: userProductsList.length,
      padding: EdgeInsets.only(top: 18.h, right: 20.w, left: 20.w),
      separatorBuilder: (context, index) => SizedBox(
        height: 16.h,
      ),
      itemBuilder: (context, index) {
        return CartProductItem(userProductItemData: userProductsList[index]);
      },
    );
  }
}

class CartProductItem extends StatelessWidget {
  final CartProductEntity userProductItemData;
  const CartProductItem({
    super.key,
    required this.userProductItemData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.h,
      // width: 376.w,
      // margin: EdgeInsets.only(top: 34.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsStyles.whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorsStyles.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE6EAF4).withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 15,
                  ),
                ],
              ),
              child: FittedBox(
                child: AppCashedImage(
                  imageUrl:
                      userProductItemData.productEntity.productImage ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              //   Image.asset(
              //     // height: 144.h,

              //     AssetsData.product,
              //     fit: BoxFit.cover,
              //   ),
            ),
            SizedBox(width: 16.w),
            CartProductDetails(
              userProductItemData: userProductItemData,
            ),
          ],
        ),
      ),
    );
  }
}
