import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            const PaymentDetailedItem(
              paymentTitle: "Subtotal",
              paymentAmount: "90.00 EGP",
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
            const PaymentDetailedItem(
              paymentTitle: "Total",
              paymentAmount: "80.00 EGP",
            ),
          ],
        ),
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
