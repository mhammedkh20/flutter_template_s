import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter_project/core/components/my_contianer_shape.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class ItemRatingBar extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool withIcons;
  final Function() onTap;

  const ItemRatingBar({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
    this.withIcons = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.TRANSPARENT,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: onTap,
          child: MyContainerShape(
            bgContainer: AppColors.TRANSPARENT,
            colorBorder: AppColors.BASE_COLOR,
            borderRadius: 8,
            enableBorder: isSelected,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (withIcons) ...[
                  SvgPicture.asset(
                    'assets/images/ic_star.svg',
                    width: 12.r,
                    height: 12.r,
                  ),
                  SizedBox(width: 6.w),
                ],
                MyText(
                  title: title,
                  fontSize: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
