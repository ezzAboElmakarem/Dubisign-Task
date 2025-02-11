import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductImageSwiper extends StatelessWidget {
  final ProductEntity? productModel;

  const ProductImageSwiper({
    super.key,
    required this.productModel,
  });

  // late SwiperController _swiperController;
  @override
  Widget build(BuildContext context) {
    // final bannerList = widget.bannerList;

    // if (bannerList.isEmpty) {
    //   return const Center(
    //     child: Text(
    //       "No banners available",
    //       style: TextStyle(color: Colors.red, fontSize: 16),
    //     ),
    //   );
    // }

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Swiper(
          //   itemCount: bannerList.length,
          //   controller: _swiperController,
          //   viewportFraction: 1,
          //   scale: 0.9,
          //   onIndexChanged: (index) {
          //     setState(() {
          //       _currentIndex = index;
          //     });
          //   },
          //   itemBuilder: (BuildContext context, int index) {
          //     final banner = bannerList[index];
          //     return banner.isEmpty
          //         ? const SizedBox()
          //         : ClipRRect(
          //             borderRadius: BorderRadius.circular(28),
          //             child: Image.network(
          //               banner,
          //               fit: BoxFit.fill,
          //               errorBuilder: (context, error, stackTrace) {
          //                 return Image.asset(
          //                   AssetsData.productScreenBackground,
          //                   fit: BoxFit.fill,
          //                 );
          //               },
          //             ),
          //           );
          //   },
          // ),

          Image.network(
              productModel?.productImage ?? AssetsData.dummyProductImage),
          // Pagination Dots
          // SliderDotsWithSwipeUpIcon(
          //     bannerList: bannerList, currentIndex: _currentIndex),
        ],
      ),
    );
  }
}
