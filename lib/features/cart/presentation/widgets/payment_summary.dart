import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/cart_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSummary extends StatelessWidget {
  final List<CartProductEntity> userProductsList;

  const PaymentSummary({
    super.key,
    required this.userProductsList,
  });

  double calculateSubtotal(List<CartProductEntity> updatedProducts) {
    return updatedProducts.fold(
      0.0,
      (sum, item) =>
          sum +
          ((item.productEntity.productPrice ?? 0) *
              (item.productQuantatiy ?? 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = calculateSubtotal(userProductsList);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Column(
        children: [
          PaymentDetailedItem(
            paymentTitle: "Subtotal",
            paymentAmount: "${subtotal.toStringAsFixed(2)} EGP",
          ),
          const PaymentDetailedItem(
            paymentTitle: "Shipping",
            paymentAmount: "15.00 EGP",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Image.asset(
              AssetsData.dotsDivider,
              color: const Color(0xffE2E2E2),
            ),
          ),
          PaymentDetailedItem(
            paymentTitle: "Total",
            paymentAmount: "${(subtotal + 15.0).toStringAsFixed(2)} EGP",
          ),
        ],
      ),
    );
  }
}

class PaymentDetailedItem extends StatelessWidget {
  final String paymentTitle, paymentAmount;
  final Color? titleColor, amountColor;
  final TextStyle? titleStyle, amountStyle;
  const PaymentDetailedItem({
    super.key,
    required this.paymentTitle,
    required this.paymentAmount,
    this.titleColor,
    this.amountColor,
    this.titleStyle,
    this.amountStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Text(
            paymentTitle,
            style: titleStyle ??
                AppStyles.styleRegular14().copyWith(
                  color: titleColor ?? ColorsStyles.hintColor,
                ),
          ),
          const Spacer(),
          Text(
            paymentAmount,
            style: amountStyle ??
                AppStyles.styleSemiBold16().copyWith(
                  color: amountColor ?? ColorsStyles.blackColor,
                ),
          ),
        ],
      ),
    );
  }
}
