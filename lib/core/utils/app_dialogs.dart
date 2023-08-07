import 'package:flutter/material.dart';
import 'package:template_flutter_project/core/components/my_text.dart';

class AppDialogs {
  static updateApplication(
    BuildContext context, {
    required Function()? onTap,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: MyText(title: 'تحديث التطبيق'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(
                title: 'لقد قمنا بإضافة ميزات جديدة على تطبيق',
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: onTap,
                child: MyText(
                  title: 'حدث التطبيق',
                  fontSize: 20,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
