import 'package:flutter/material.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class MySwitchWithTitle extends StatefulWidget {
  final bool? initValue;
  final Function onChanged;
  final Color? activeColor;
  final Color? titleColor;
  final String title;
  final double fontSize;
  final FontWeight fontWeight;

  const MySwitchWithTitle({
    Key? key,
    required this.onChanged,
    required this.title,
    this.fontSize = 12,
    this.titleColor = AppColors.GRAY3,
    this.fontWeight = FontWeight.w500,
    this.initValue,
    this.activeColor,
  }) : super(key: key);

  @override
  State<MySwitchWithTitle> createState() => _MySwitchWithTitleState();
}

class _MySwitchWithTitleState extends State<MySwitchWithTitle> {
  late bool value;

  @override
  void initState() {
    if (widget.initValue == null) {
      value = false;
    } else {
      value = widget.initValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          title: widget.title,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.titleColor,
        ),
        Switch.adaptive(
          activeColor: widget.activeColor,
          value: value,
          onChanged: (bool? enabled) {
            if (enabled != null) {
              value = !value;
              setState(() {
                widget.onChanged(enabled);
              });
            }
          },
        ),
      ],
    );
  }
}
