// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String textHint;
  final int? minLines;
  final int? maxLines;
  bool obscureText;
  final bool isBorder;
  final String? Function(String?)? validator;
  final Color textColor;
  final Color hintColor;
  final ValueChanged<String>? onChange;
  final bool filledColor;
  final bool isDense;
  final Color fillColor;
  final Color? fillColor2;
  final double fontSize;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool readOnly;
  final Widget? suffixWidget;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color colorBorder;
  final FontWeight? fontWeight;
  final Function()? onTap;
  final Widget? prefixIcon;
  final bool isError;
  final bool isBorderUnderLine;
  final int? maxLength;
  final Color borderSide;
  final String? labelText;
  final Widget? icon;
  final bool obscureEnabled;
  final double borderRadius;
  final List<TextInputFormatter>? inputFormatters;

  MyTextField({
    required this.textHint,
    this.obscureText = false,
    super.key,
    this.controller,
    this.maxLines,
    this.minLines,
    this.validator,
    this.isBorder = false,
    this.onTap,
    this.textColor = Colors.black,
    this.fontWeight,
    this.hintColor = AppColors.ICON_COLOR,
    this.filledColor = true,
    this.fillColor = AppColors.WHITE4,
    this.fillColor2 = AppColors.WHITE4,
    this.borderSide = AppColors.BASE_COLOR,
    this.onChange,
    this.isDense = false,
    this.fontSize = 14,
    this.paddingHorizontal = 20,
    this.paddingVertical = 0,
    this.autofocus = false,
    this.readOnly = false,
    this.suffixWidget,
    this.focusNode,
    this.colorBorder = AppColors.BORDER,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.isError = false,
    this.isBorderUnderLine = false,
    this.labelText,
    this.icon,
    this.maxLength,
    this.obscureEnabled = false,
    this.inputFormatters,
    this.borderRadius = 8,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    if (widget.obscureEnabled) {
      widget.obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      controller: widget.controller,
      minLines: widget.minLines,
      textInputAction: TextInputAction.done,
      maxLines: widget.maxLines,
      validator: widget.validator,
      textAlign: TextAlign.start,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      onChanged: widget.onChange,
      onTap: widget.onTap ??
          () {
            if (widget.controller != null) {
              widget.controller!.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller!.text.length));
            }
          },
      autofocus: widget.autofocus,
      style: TextStyle(
        fontSize: widget.fontSize.sp,
        color: widget.textColor,
        fontWeight: widget.fontWeight,
        fontFamily: 'Montserrat',
      ),
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.textHint,
        isDense: widget.isDense,
        fillColor: widget.fillColor2 ??
            (widget.focusNode != null
                ? widget.focusNode!.hasFocus
                    ? widget.fillColor.withOpacity(.05)
                    : AppColors.TRANSPARENT
                : null),
        filled: widget.filledColor,
        hintStyle: TextStyle(
          fontSize: widget.fontSize.sp,
          color: widget.hintColor,
          fontWeight: FontWeight.w300,
          fontFamily: 'Montserrat',
        ),
        suffixIcon: widget.obscureEnabled
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                child: widget.obscureText
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints(),
        enabledBorder: widget.isBorder
            ? widget.isBorderUnderLine
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.isError
                            ? AppColors.RED
                            : widget.colorBorder),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius.r),
                    borderSide: BorderSide(
                        color: widget.isError
                            ? AppColors.RED
                            : widget.colorBorder),
                  )
            : InputBorder.none,
        focusedBorder: widget.isBorder
            ? widget.isBorderUnderLine
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            widget.isError ? AppColors.RED : widget.borderSide))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius.r),
                    borderSide: BorderSide(
                        color:
                            widget.isError ? AppColors.RED : widget.borderSide))
            : InputBorder.none,
        focusedErrorBorder: widget.isBorder
            ? widget.isBorderUnderLine
                ? UnderlineInputBorder(
                    borderSide: BorderSide(color: widget.borderSide),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius.r),
                    borderSide: BorderSide(color: widget.borderSide))
            : InputBorder.none,
        errorBorder: widget.isBorder
            ? widget.isBorderUnderLine
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.RED),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius.r),
                    borderSide: const BorderSide(color: AppColors.RED),
                  )
            : InputBorder.none,
      ),
    );
  }
}
