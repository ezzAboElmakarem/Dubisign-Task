import 'package:dubisign_task_clean_arch/core/utils/routes.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/product_screen/presentation/views/product_screen_view.dart';

import '../utils/assets.dart';
import '../utils/colors_styles.dart';
import '../utils/text_styles.dart';
import 'card_image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final ProductEntity productModel;
  const CustomCard({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RouteUtils.navigateWithSlideTransition(
          ProductScreenView(
            productModel: productModel,
          ),
        );
      },
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorsStyles.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120.h,
              child: CardImageSection(
                imageUrl: productModel.productImage ?? AssetsData.product,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productModel.productName,
                      style: AppStyles.styleRegular16(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Price
                    Text(
                      '\$${productModel.productPrice ?? 'dummy price'}',
                      // '\$444',
                      style: AppStyles.styleSemiBold16(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
