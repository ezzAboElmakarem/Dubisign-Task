import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:dubisign_task_clean_arch/features/cart/domain/entities/cart_product_entity.dart';
import 'package:dubisign_task_clean_arch/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductDetails extends StatefulWidget {
  final CartProductEntity userProductItemData;

  const CartProductDetails({super.key, required this.userProductItemData});

  @override
  State<CartProductDetails> createState() => _CartProductDetailsState();
}

class _CartProductDetailsState extends State<CartProductDetails> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.userProductItemData.productQuantatiy ?? 1;
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
    BlocProvider.of<CartCubit>(context)
        .updateProductQuantity(widget.userProductItemData, quantity);
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      BlocProvider.of<CartCubit>(context)
          .updateProductQuantity(widget.userProductItemData, quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = CartCubit.get(context);
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      widget.userProductItemData.productEntity.productName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.styleRegular14(),
                    ),
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
                '\$${widget.userProductItemData.productEntity.productPrice}',
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
                    onTap: () {
                      cubit.removeProductFromCart(widget.userProductItemData);
                    },
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
      },
    );
  }
}
