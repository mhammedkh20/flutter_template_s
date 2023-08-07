import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template_flutter_project/core/components/my_contianer_shape.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class PickFile extends StatelessWidget {
  final String? imagePath;
  final Function()? onTap;

  const PickFile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.WHITE,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: MyContainerShape(
          height: 40.h,
          width: 150.w,
          bgContainer: AppColors.TRANSPARENT,
          borderRadius: 6,
          colorBorder: AppColors.ICON_COLOR,
          enableBorder: true,
          child: imagePath != null
              ? Image.file(
                  File(imagePath!),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/ic_file.svg'),
                    SizedBox(width: 10.w),
                    MyText(
                      title: AppLocalizations.of(context)!.attachAFile,
                      color: AppColors.ICON_COLOR,
                      fontSize: 10,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
