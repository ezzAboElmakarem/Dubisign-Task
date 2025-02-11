import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderDotsWithSwipeUpIcon extends StatelessWidget {
  const SliderDotsWithSwipeUpIcon({
    super.key,
    required this.bannerList,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final List<String> bannerList;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Column(
        children: [
          Image.asset(AssetsData.swipeUpIcon),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              "Swipe up for details",
              style: AppStyles.styleRegular14().copyWith(
                color: ColorsStyles.whiteColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(bannerList.length, (index) {
              bool isActive = _currentIndex == index;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 12 : 6,
                height: isActive ? 12 : 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? Colors.transparent : ColorsStyles.hintColor,
                  border: isActive
                      ? Border.all(color: ColorsStyles.whiteColor, width: 2.w)
                      : null,
                ),
                child: isActive
                    ? Container(
                        margin: EdgeInsets.all(1.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsStyles.whiteColor,
                        ),
                      )
                    : null,
              );
            }),
          ),
        ],
      ),
    );
  }
}
