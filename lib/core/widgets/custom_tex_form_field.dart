import '../utils/colors_styles.dart';
import '../utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.controller,
      this.labelText,
      this.hint,
      this.title,
      this.fillColor,
      this.textAlign,
      // required this.textDirection,
      this.prefixIcon,
      this.prefixText,
      this.suffixIcon,
      this.onChange,
      this.onSaved,
      this.onSubmitted,
      this.errorColor,
      this.hintColor,
      this.borderColor,
      this.validation,
      this.ispassword,
      this.isEnabled,
      this.readOnly,
      this.maxLines,
      this.labelColor,
      this.textColor,
      // required hintText,
      required this.keyboardType,
      this.onTap,
      this.inputFormatters,
      this.textStyle,
      this.labelStyle,
      this.borderRadius});
  TextEditingController? controller;
  TextInputType? keyboardType;
  final Color? textColor;
  String? hint;
  final double? borderRadius;
  String? labelText;
  final Color? labelColor;
  final String? title;
  Color? titleColor = Colors.black;
  Color? fillColor;
  TextDirection? textDirection;
  Widget? prefixIcon;
  String? prefixText;
  Widget? suffixIcon;
  Function(String)? onChange;
  void Function(String?)? onSaved;
  Function(String)? onSubmitted;
  final void Function()? onTap;
  Color? errorColor;
  bool? ispassword;
  bool? isEnabled;
  bool? readOnly;
  String? Function(String?)? validation;
  int? maxLines;
  Color? hintColor;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  Color? borderColor;
  TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 327.w,
      child: Column(
        children: [
          title == null
              ? const SizedBox.shrink()
              : Row(
                  //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Text(title ?? '',
                          style: AppStyles.styleMedium16().copyWith(
                            color: titleColor,
                          )),
                    ),
                  ],
                ),
          TextFormField(
            textAlign: textAlign ?? TextAlign.start,
            enabled: isEnabled ?? true,
            readOnly: readOnly ?? false,
            inputFormatters: inputFormatters,
            maxLines: maxLines ?? 1,
            style: textStyle ??
                AppStyles.styleMedium16().copyWith(
                  color: textColor ?? ColorsStyles.blackColor,
                ),
            //textdirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
            obscureText: ispassword ?? false,
            onChanged: onChange,
            onFieldSubmitted: onSubmitted,
            onSaved: onSaved,
            onTap: onTap,
            controller: controller,
            validator: validation,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
              labelText: labelText,
              labelStyle: labelStyle ??
                  AppStyles.styleRegular14().copyWith(
                      color: labelColor ?? ColorsStyles.lightBlackColor),
              //  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              errorStyle: AppStyles.styleSemiBold14().copyWith(
                color: errorColor ?? ColorsStyles.redColor,
              ),
              hintStyle: AppStyles.styleLight16().copyWith(
                color: hintColor ?? ColorsStyles.lightBlackColor,
              ),

              // hintTextDirection:
              //     TextDirection.rtl : TextDirection.ltr,
              prefixText: prefixText,
              prefixStyle: AppStyles.styleMedium18()
                  .copyWith(fontWeight: FontWeight.bold),

              filled: true,
              fillColor: fillColor ?? const Color(0x0fffffff),
              hintText: hint,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorsStyles.hintColor,
                  width: 0.8.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 8),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorsStyles.hintColor,
                  width: 0.8.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 8),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorsStyles.redColor,
                  width: 1.w,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorsStyles.redColor,
                  width: 1.w,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorsStyles.hintColor,
                  width: 0.8.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 8),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? ColorsStyles.hintColor,
                  width: 0.5.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
