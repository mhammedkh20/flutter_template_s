import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter_project/core/components/my_contianer_shape.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class PickImage extends StatelessWidget {
  final Function()? onTap;
  final Function()? onTapDelete;
  final String? imagePath;

  const PickImage({
    super.key,
    this.onTap,
    this.imagePath,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Material(
        color: AppColors.WHITE,
        borderRadius: BorderRadius.circular(8.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: MyContainerShape(
            height: 80.r,
            width: 80.r,
            borderRadius: 8,
            bgContainer: AppColors.TRANSPARENT,
            child: imagePath != null
                ? Stack(
                    children: [
                      Image.file(
                        File(imagePath!),
                        fit: BoxFit.cover,
                        height: 80.r,
                        width: 80.r,
                      ),
                      onTapDelete != null
                          ? PositionedDirectional(
                              top: 4,
                              end: 4,
                              child: GestureDetector(
                                onTap: onTapDelete,
                                child: MyContainerShape(
                                  borderRadius: 20,
                                  height: 20.r,
                                  width: 20.r,
                                  bgContainer: AppColors.BLACK.withOpacity(.5),
                                  child: Icon(
                                    Icons.close,
                                    size: 17.r,
                                    color: AppColors.WHITE,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  )
                : SvgPicture.asset(
                    'assets/images/ic_image.svg',
                    width: 24.r,
                  ),
          ),
        ),
      ),
    );
  }
}
