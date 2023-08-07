import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80.r,
        height: 80.r,
        child: LottieBuilder.asset(
          'assets/json/ic_loading.json',
        ),
      ),
    );
  }
}
