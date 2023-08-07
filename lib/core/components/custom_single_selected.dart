import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomSingleSelected extends StatelessWidget {
  final List<Widget> items;
  const CustomSingleSelected({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 5.r),
      child: Row(
        children: items,
      ),
    );
  }
}
