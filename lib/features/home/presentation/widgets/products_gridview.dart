import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/widgets/custom_card.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/manager/get_products_cubit/get_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsGridView extends StatelessWidget {
  // final GetProductsCubit cubit;
  final List<ProductEntity> products;
  const ProductsGridView({
    super.key,
    // required this.cubit,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // itemCount: cubit.productsData.length,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.sizeOf(context).width >= 960 ? 4 : 2,
            mainAxisExtent: 260.h,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorsStyles.selectedChoiceColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
                color: ColorsStyles.whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ColorsStyles.lightGreyColor.withOpacity(0.4),
                ),
              ),
              child: CustomCard(
                productModel: product,
              ),
            );
          },
        ),
      ),
    );
  }
}
