import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class ItemRadio extends StatelessWidget {
  final int value;
  final int indexKey;
  final String title;
  final Function(int?)? onChanged;
  final bool withExpanded;
  final double fontSize;
  final FontWeight fontWeight;
  final Color baseColor;
  final Color titleColor;
  final double spaceBetween;

  const ItemRadio({
    super.key,
    required this.title,
    required this.onChanged,
    required this.value,
    required this.indexKey,
    this.spaceBetween = 10,
    this.withExpanded = false,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w500,
    this.baseColor = AppColors.BASE_COLOR,
    this.titleColor = AppColors.GRAY3,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        children: [
          SizedBox(
            width: 24.r,
            height: 24.r,
            child: Radio<int>(
              value: indexKey,
              groupValue: value,
              onChanged: onChanged,
              // hoverColor: baseColor,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return value == indexKey
                      ? baseColor.withOpacity(.32)
                      : AppColors.GRAY.withOpacity(.32);
                }
                return value == indexKey ? baseColor : AppColors.GRAY;
              }),
            ),
          ),
          SizedBox(width: spaceBetween.w),
          withExpanded
              ? Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onChanged!(indexKey);
                    },
                    child: MyText(
                      title: title,
                      fontSize: fontSize.sp,
                      fontWeight: fontWeight,
                      color: titleColor,
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    onChanged!(indexKey);
                  },
                  child: MyText(
                    title: title,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: titleColor,
                  ),
                ),
        ],
      ),
    );
  }
}
