import 'package:dubisign_task_clean_arch/features/favourite/presentation/views/favourite_view.dart';
import 'package:dubisign_task_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:dubisign_task_clean_arch/features/notification/presentation/views/notification_view.dart';
import 'package:dubisign_task_clean_arch/features/profile/presentation/views/profile_view.dart';

import '../main_pages/cubit/nav_bar_cubit.dart';
import '../main_pages/cubit/nav_bar_state.dart';
import 'assets.dart';
import 'colors_styles.dart';
import 'text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarView extends StatefulWidget {
  final int? index;

  const NavBarView({super.key, this.index});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

Widget icon({
  required String imagePath,
  required bool isSelected,
}) =>
    Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 6.h),
      child: Image.asset(
        imagePath,
        color: isSelected ? kPrimaryColor : ColorsStyles.greyColor,
        height: 30.h,
        width: 30.w,
      ),
    );

class _NavBarViewState extends State<NavBarView> {
  @override
  void initState() {
    if (widget.index != null) {
      context.read<NavBarCubit>().currentViewIndex = widget.index!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarStates>(
      builder: (context, state) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) {
            if (NavBarCubit.of(context).currentViewIndex != 0) {
              NavBarCubit.of(context).changeView(0);
            }
          },
          canPop: false,
          child: Scaffold(
            backgroundColor: ColorsStyles.whiteColor,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: ColorsStyles.whiteColor,
              unselectedItemColor: ColorsStyles.blackColor,
              selectedLabelStyle:
                  AppStyles.styleMedium14().copyWith(color: kPrimaryColor),
              unselectedLabelStyle: AppStyles.styleRegular12()
                  .copyWith(color: ColorsStyles.lightGreyColor),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kPrimaryColor,
              currentIndex: context.read<NavBarCubit>().currentViewIndex,
              onTap: (index) {
                context.read<NavBarCubit>().changeView(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsData.homeIcon,
                    width: 26.w,
                    height: 26.h,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsData.homeIcon,
                    width: 26.w,
                    height: 26.h,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsData.heartIcon,
                    width: 26.w,
                    height: 26.h,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsData.heartIcon,
                    width: 26.w,
                    height: 26.h,
                    colorFilter: const ColorFilter.mode(
                        ColorsStyles.blackColor, BlendMode.srcIn),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsData.notificationIcon,
                    width: 26.w,
                    height: 26.h,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsData.notificationIcon,
                    width: 26.w,
                    height: 26.h,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsData.profileIcon,
                    width: 26.w,
                    height: 26.h,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsData.profileIcon,
                    width: 26.w,
                    height: 26.h,
                  ),
                  label: "",
                ),
              ],
            ),
            body: body(index: context.read<NavBarCubit>().currentViewIndex),
          ),
        );
      },
    );

//?Put it up there, and use it to check that the user data has been loaded
    // return
    // BlocBuilder<UserBloc, AppState>(
    //   builder: (context, state) {
    //     if (state is Done) {
    //       return StreamBuilder<String>(
    //         stream: mainAppBloc.langStream,
    //         builder: (context, lang) {

    //           },
    //       );
    //     }
    //     return Container();
    //   },
    // );
  }
}

Widget body({required int index}) {
  switch (index) {
    case 0:
      // HomeBloc.instance.add(Get());
      return const HomeView();
    case 1:
      // PostsListBloc.instance.selectedTap = 0;
      // PostsListBloc.instance.clearFilters();
      // PostsListBloc.instance.add(Get());
      return const FavouriteView();
    case 2:
      // MyClassesBloc.instance.clearFilters();
      // MyClassesBloc.instance.add(Get());
      return const NotificationView();
    case 3:
      // MyClassesBloc.instance.clearFilters();
      // MyClassesBloc.instance.add(Get());
      return const ProfileView();

    default:
      return Container(
        color: ColorsStyles.greyColor,
      );
  }
}
