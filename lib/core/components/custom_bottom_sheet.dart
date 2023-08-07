import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template_flutter_project/core/components/my_contianer_shape.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const CustomBottomSheet({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: MyContainerShape(
            height: 60.h,
            paddingHorizontal: 16,
            bgContainer: AppColors.TRANSPARENT,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: MyText(
                    title: title,
                    fontWeight: FontWeight.w300,
                    color: AppColors.GRAY3,
                  ),
                ),
                Transform.rotate(
                  angle: pi * (2 / 4),
                  child: SvgPicture.asset(
                    'assets/images/ic_arrow_down2.svg',
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 1.h,
          color: AppColors.GRAY.withOpacity(.1),
        ),
      ],
    );
  }
}
