import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/routes.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:dubisign_task_clean_arch/core/widgets/custom_app_bar.dart';
import 'package:dubisign_task_clean_arch/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:dubisign_task_clean_arch/features/cart/presentation/widgets/cart_products_listview.dart';
import 'package:dubisign_task_clean_arch/features/cart/presentation/widgets/check_out_floating_button.dart';
import 'package:dubisign_task_clean_arch/features/cart/presentation/widgets/payment_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CheckOutFloatingButton(),
      appBar: CustomAppBar(
        context: context,
        shadow: false,
        leading: InkWell(
          onTap: () {
            RouteUtils.pop();
          },
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: SvgPicture.asset(
              AssetsData.backArrowIcon,
              colorFilter: const ColorFilter.mode(
                  ColorsStyles.blackColor, BlendMode.srcIn),
            ),
          ),
        ),
        title: "Cart",
        titleStyle: AppStyles.styleSemiBold20(),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = CartCubit.get(context);
          if (state is UserProductsFailure) {
            return Center(child: Text(state.error));
          } else if (state is UserProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserProductsSuccess) {
            if (state.userProducts.isEmpty) {
              return const Center(
                child: Text(
                  "The cart is empty",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            }

            return SingleChildScrollView(
              child: Container(
                color: ColorsStyles.greyColor,
                height: MediaQuery.sizeOf(context).height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CartProductsListView(
                        userProductsList: state.userProducts,
                      ),
                      SizedBox(height: 100.h),
                      PaymentSummary(
                        userProductsList: state.userProducts,
                      ),
                      SizedBox(height: 200.h),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text("Unhandled Exception"));
          }
        },
      ),
    );
  }
}
