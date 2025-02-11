// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:dubisign_task_clean_arch/features/product_screen/presentation/widgets/product_details_section.dart';
import 'package:dubisign_task_clean_arch/features/product_screen/presentation/widgets/swipe_up_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductScreenView extends StatelessWidget {
  final ProductEntity? productModel;

  const ProductScreenView({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SizedBox(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.sizeOf(context).height * .8,
              flexibleSpace: FlexibleSpaceBar(
                //  product image swipe Up Section
                background: SwipeUpSection(
                  productModel: productModel,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark,
              ),
            ),
            // product details
            SliverToBoxAdapter(
              child: ProductDetailsSection(
                productModel: productModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
