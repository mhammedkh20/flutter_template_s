import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class MyContainerShape extends StatelessWidget {
  final Widget? child;
  final Color shadow;
  final Color? bgContainer;
  final Color colorBorder;
  final bool enableShadow;
  final bool enableRadius;
  final bool enableBorder;
  final BoxShape boxShape;
  final AlignmentDirectional? alignment;
  final double? height;
  final double? width;
  final double widthBorder;
  final double paddingVertical;
  final double paddingHorizontal;
  final double borderRadius;
  final double xOffset;
  final double yOffset;
  final double blur;
  final double marginTop;
  final double marginBottom;
  final double marginStart;
  final double marginEnd;
  final Gradient? gradient;
  final double topEndRaduis;
  final double topStartRaduis;
  final double bottomStartRaduis;
  final double bottomEndRaduis;

  const MyContainerShape({
    super.key,
    this.height,
    this.width,
    this.boxShape = BoxShape.rectangle,
    this.paddingVertical = 0,
    this.paddingHorizontal = 0,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.marginStart = 0,
    this.marginEnd = 0,
    this.borderRadius = 0,
    this.xOffset = 0,
    this.widthBorder = 1,
    this.yOffset = 10,
    this.blur = 18,
    this.gradient,
    this.alignment = AlignmentDirectional.center,
    this.enableShadow = false,
    this.enableRadius = true,
    this.enableBorder = false,
    this.shadow = AppColors.BLACK,
    this.bgContainer = AppColors.WHITE,
    this.colorBorder = AppColors.BORDER,
    this.child,
    this.bottomEndRaduis = 0,
    this.topStartRaduis = 0,
    this.topEndRaduis = 0,
    this.bottomStartRaduis = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      alignment: alignment,
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical.h,
        horizontal: paddingHorizontal.w,
      ),
      margin: EdgeInsetsDirectional.only(
        top: marginTop,
        bottom: marginBottom,
        start: marginStart,
        end: marginEnd,
      ),
      decoration: BoxDecoration(
        color: bgContainer,
        shape: boxShape,
        gradient: gradient,
        borderRadius: enableRadius
            ? borderRadius == 0
                ? BorderRadiusDirectional.only(
                    topEnd: Radius.circular(topEndRaduis.r),
                    topStart: Radius.circular(topStartRaduis.r),
                    bottomEnd: Radius.circular(bottomEndRaduis.r),
                    bottomStart: Radius.circular(bottomStartRaduis.r),
                  )
                : BorderRadius.circular(borderRadius.r)
            : null,
        boxShadow: enableShadow
            ? [
                BoxShadow(
                  color: shadow,
                  offset: Offset(xOffset, yOffset),
                  blurRadius: blur,
                ),
              ]
            : null,
        border: enableBorder
            ? Border.all(color: colorBorder, width: widthBorder)
            : null,
      ),
      child: child,
    );
  }
}
