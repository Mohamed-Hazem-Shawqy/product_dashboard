import 'package:flutter/material.dart';
import 'package:product_dashboard/core/utils/app_color.dart';
import 'package:product_dashboard/core/utils/app_text_style.dart';

class IsFeatured extends StatefulWidget {
  const IsFeatured({super.key, required this.onChangedTerms, required this.text});
  final ValueChanged<bool> onChangedTerms;
  final String text;

  @override
  State<IsFeatured> createState() => _IsFeaturedState();
}

class _IsFeaturedState extends State<IsFeatured> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(9, 0),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            splashRadius: 0,
            activeColor: AppColor.appDarkGreenColor,
            side: BorderSide(color: AppColor.appDarkGreenColor, strokeAlign: 4),
            value: isSelect,
            onChanged: (val) {
              isSelect = val!;
              widget.onChangedTerms(val);
              setState(() {});
            },
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:widget. text,
                    style: AppTextStyle.semiBold14.copyWith(
                      color: AppColor.appGreenColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
