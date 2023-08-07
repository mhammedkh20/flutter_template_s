import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class MyCheckBox extends StatefulWidget {
  final bool? initValue;
  final Function onChanged;
  final Color textColor;
  final String? title;
  final FontWeight fontWeight;
  final double fontSize;
  final double space;
  final bool notify;
  final double borderRaduis;
  final bool withDivider;

  const MyCheckBox({
    Key? key,
    required this.onChanged,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.textColor = AppColors.BLACK,
    this.space = 5,
    this.title,
    this.initValue,
    this.notify = false,
    this.borderRaduis = 4,
    this.withDivider = false,
  }) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  late bool value;
  @override
  void initState() {
    if (widget.initValue != null) {
      value = widget.initValue!;
    } else {
      value = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.notify) {
      value = widget.initValue ?? false;
    }
    return GestureDetector(
      onTap: () {
        value = !value;

        setState(() {
          widget.onChanged(value);
        });
      },
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 24.r,
                height: 24.r,
                child: Checkbox(
                  value: value,
                  onChanged: (bool? enabled) {
                    if (enabled != null) {
                      value = enabled;

                      setState(() {
                        widget.onChanged(value);
                      });
                    }
                  },
                  hoverColor: AppColors.BASE_COLOR,
                  side: BorderSide(
                    color: value ? AppColors.BASE_COLOR : AppColors.GRAY,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.borderRaduis.r),
                  ),
                ),
              ),
              if (widget.title != null) ...[
                SizedBox(width: widget.space.w),
                Expanded(
                  child: MyText(
                    title: widget.title!,
                    fontSize: widget.fontSize,
                    height: 0,
                    color: widget.textColor,
                    fontWeight: widget.fontWeight,
                  ),
                ),
              ]
            ],
          ),
          if (widget.withDivider) ...[
            SizedBox(height: 5.h),
            Divider(height: 1.h),
          ]
        ],
      ),
    );
  }
}
