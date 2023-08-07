// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class MyText extends StatelessWidget {
  String title;
  Color? color;
  double fontSize;
  double height;
  FontWeight fontWeight;
  TextAlign textAlign;
  bool lineThrough;
  bool typeLineThrough;
  bool textOverflow;
  int? maxLines;

  MyText({
    Key? key,
    required this.title,
    this.color = AppColors.BLACK,
    this.fontSize = 14,
    this.height = 1.5,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.lineThrough = false,
    this.textOverflow = false,
    this.typeLineThrough = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      overflow: textOverflow ? TextOverflow.ellipsis : null,
      maxLines: maxLines,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        height: height,
        decorationThickness: 1,
        decoration: lineThrough
            ? typeLineThrough
                ? TextDecoration.lineThrough
                : TextDecoration.underline
            : null,
      ),
    );
  }
}
