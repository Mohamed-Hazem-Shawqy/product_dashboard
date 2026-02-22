import 'package:flutter/material.dart';
import 'package:product_dashboard/core/utils/app_color.dart';
import 'package:product_dashboard/core/utils/app_text_style.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
     
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.controller, this.maxLine,
  });

  final String hintText;
  final int? maxLine;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        } return null;
      },
      controller: controller,
      cursorColor: AppColor.appDarkGreenColor,

      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: AppColor.appGrayColor,
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: hintText,
        hintStyle: AppTextStyle.bold12.copyWith(color: AppColor.appGrayColor),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }
}

InputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(width: .9, color: Color(0xffE6E9EA)),
  );
}
