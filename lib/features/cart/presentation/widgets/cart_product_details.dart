import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductDetails extends StatefulWidget {
  const CartProductDetails({
    super.key,
  });

  @override
  State<CartProductDetails> createState() => _CartProductDetailsState();
}

class _CartProductDetailsState extends State<CartProductDetails> {
  int quantity = 1;

  // Function to increment the quantity
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  // Function to decrement the quantity
  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      } else {
        // quantity = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Bomber Jackets",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppStyles.styleRegular14(),
              ),
              const Spacer(),
              Text(
                "L",
                style: AppStyles.styleSemiBold16(),
              )
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            "\$49.99",
            style: AppStyles.styleSemiBold16(),
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: incrementQuantity,
                    child: Image.asset(
                      AssetsData.plusIcon,
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    quantity.toString(),
                    style: AppStyles.styleSemiBold14(),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: decrementQuantity,
                    child: Image.asset(
                      AssetsData.minimizeIcon,
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                child: Image.asset(
                  AssetsData.deleteIcon,
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
