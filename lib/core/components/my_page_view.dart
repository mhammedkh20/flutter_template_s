import 'dart:async';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';

class MyPageView extends StatefulWidget {
  final List<String> images;
  final bool withAnimation;
  const MyPageView(
      {super.key, required this.images, this.withAnimation = false});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  int _currentPage = 0;
  double _pageOffset = 0;
  final double _viewportFraction = 1;
  late Timer _timer;

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 0, viewportFraction: _viewportFraction)
          ..addListener(() {
            setState(() {
              _pageOffset = _pageController.page ?? 0;
            });
          });
    if (widget.images.length > 1 && widget.withAnimation) {
      _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        if (_currentPage < widget.images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageOffset = _pageController.page ?? 0;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    if (widget.images.length > 1 && widget.withAnimation) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Column(
        children: [
          SizedBox(
            height: 165.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (int indexPage) {
                _currentPage = indexPage;
              },
              itemBuilder: ((context, index) {
                double scale = max(_viewportFraction,
                    (1 - (_pageOffset - index).abs()) + _viewportFraction);

                double angle = (_pageOffset - index).abs();
                if (angle > 0.5) {
                  angle = 1 - angle;
                }

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle),
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                      end: 0.w,
                      top: 50 - scale * 25,
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppColors.BORDER,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: CachedImageWidget(
                        image: widget.images[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 10.h),
          generateIndecators(),
        ],
      ),
    );
  }

  Widget generateIndecators() {
    List<Widget> widgets = [];

    for (int i = 0; i < widget.images.length; i++) {
      widgets.add(itemIndecator(_currentPage == i));
      widgets.add(SizedBox(width: 4.w));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }

  Widget itemIndecator(bool selected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 18.w,
      height: selected ? 4.h : 3.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: selected
            ? AppColors.BASE_COLOR
            : AppColors.BASE_COLOR.withOpacity(.5),
      ),
    );
  }
}

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    Key? key,
    this.image,
    this.height = 70,
    this.width = 70,
    this.color,
    this.placeholder = const Center(
      child: CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black12,
          color: Colors.black54),
    ),
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String? image;
  final double height;
  final double width;
  final Widget placeholder;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) => image == null
      ? placeholder
      : Image.network(
          image!,
          color: color,
          width: width,
          height: height,
          fit: fit,
        );
}
