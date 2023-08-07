import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class MyCustomBottomNav extends StatelessWidget {
  final Widget child;
  const MyCustomBottomNav({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff0074D9).withOpacity(0.09),
            blurRadius: 50,
          )
        ],
        color: AppColors.WHITE,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          child,
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10.h),
        ],
      ),
    );
  }
}
