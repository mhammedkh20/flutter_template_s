// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter_project/core/components/my_contianer_shape.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class MyDropdownMenu2<T> extends StatelessWidget {
  T initValue;
  ValueChanged<T?> onChanged;
  double? width;
  double? height;
  bool enabledBorder;
  AlignmentDirectional alignment;
  double paddingHorizontal;
  Color textColor;
  bool isDense;
  Widget? iconDropdown;
  bool forceIconDropdownNULL;
  bool isExpanded;
  List<DropdownMenuItem<T>>? items;
  Color dropdownColor;

  MyDropdownMenu2({
    super.key,
    required this.initValue,
    required this.onChanged,
    required this.items,
    this.enabledBorder = true,
    this.isDense = false,
    this.alignment = AlignmentDirectional.center,
    this.width = 176,
    this.height = 60,
    this.paddingHorizontal = 20,
    this.textColor = AppColors.GRAY,
    this.iconDropdown,
    this.isExpanded = false,
    this.forceIconDropdownNULL = false,
    this.dropdownColor = AppColors.WHITE,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainerShape(
      // width: width.w,
      height: height,
      paddingHorizontal: paddingHorizontal.w,
      alignment: alignment,
      enableRadius: true,
      enableBorder: enabledBorder,
      enableShadow: false,
      bgContainer: AppColors.TRANSPARENT,
      borderRadius: 10.r,
      topEndRaduis: 10,
      topStartRaduis: 10,
      bottomEndRaduis: 10,
      bottomStartRaduis: 10,
      widthBorder: 1,
      child: DropdownButton<T>(
        borderRadius: BorderRadius.circular(10.r),
        alignment: alignment,
        underline: const SizedBox(),
        autofocus: false,
        value: initValue,
        isDense: isDense,
        isExpanded: isExpanded,
        icon: setIcon(),
        dropdownColor: dropdownColor,
        items: items,
        onChanged: onChanged,
      ),
    );
  }

  Widget setIcon() {
    if (iconDropdown != null) {
      return iconDropdown!;
    }
    if (forceIconDropdownNULL) {
      return const SizedBox();
    }
    return Row(
      children: [
        SizedBox(width: 5.w),
        SvgPicture.asset(
          'assets/images/ic_arrow_down.svg',
          width: 14.r,
        ),
      ],
    );
  }
}
