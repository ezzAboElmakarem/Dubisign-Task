import 'package:dubisign_task_clean_arch/core/utils/assets.dart';
import 'package:dubisign_task_clean_arch/core/utils/colors_styles.dart';
import 'package:dubisign_task_clean_arch/core/widgets/custom_tex_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: CustomTextFormField(
        hint: "What are you looking for...",
        hintColor: ColorsStyles.hintColor,
        borderRadius: 60,
        fillColor: ColorsStyles.greyColor,
        borderColor: ColorsStyles.greyColor,
        keyboardType: TextInputType.text,
        prefixIcon: Padding(
          padding: EdgeInsets.all(14.h),
          child: SvgPicture.asset(
            AssetsData.searchIcon,
          ),
        ),
      ),
    );
  }
}
