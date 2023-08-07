import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_project/core/components/my_contianer_shape.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class ItemCounter extends StatefulWidget {
  final Function(int) setOnClickListener;
  final String title;

  const ItemCounter({
    super.key,
    required this.title,
    required this.setOnClickListener,
  });

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          fontWeight: FontWeight.w500,
          title: widget.title,
        ),
        MyContainerShape(
          borderRadius: 8,
          paddingHorizontal: 16,
          paddingVertical: 12,
          bgContainer: AppColors.GRAY,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  counter++;

                  widget.setOnClickListener(counter);
                  setState(() {});
                },
                child: MyContainerShape(
                  height: 32.r,
                  width: 32.r,
                  borderRadius: 4,
                  child: const Icon(
                    Icons.add,
                    color: AppColors.BLACK,
                  ),
                ),
              ),
              SizedBox(width: 24.w),
              MyText(
                title: '$counter',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 0,
              ),
              SizedBox(width: 24.w),
              GestureDetector(
                onTap: () {
                  if (counter > 1) {
                    counter--;

                    widget.setOnClickListener(counter);
                    setState(() {});
                  }
                },
                child: MyContainerShape(
                  height: 32.r,
                  width: 32.r,
                  borderRadius: 4,
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.BLACK,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
