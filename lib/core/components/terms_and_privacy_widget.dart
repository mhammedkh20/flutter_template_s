import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template_flutter_project/core/components/my_contianer_shape.dart';
import 'package:template_flutter_project/core/utils/app_colors.dart';
import 'package:template_flutter_project/core/utils/app_helpers.dart';

class TermsAndPrivacyPolicyWidget extends StatefulWidget {
  const TermsAndPrivacyPolicyWidget({
    super.key,
  });

  @override
  State<TermsAndPrivacyPolicyWidget> createState() =>
      _TermsAndPrivacyPolicyWidgetState();
}

class _TermsAndPrivacyPolicyWidgetState
    extends State<TermsAndPrivacyPolicyWidget> {
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              enabled = !enabled;
            });
          },
          child: MyContainerShape(
            height: 24,
            width: 24,
            colorBorder: AppColors.GRAY,
            enableBorder: true,
            borderRadius: 4,
            bgContainer: enabled ? AppColors.BLACK : AppColors.WHITE,
            child: Icon(
              Icons.check,
              color: AppColors.WHITE,
              size: 18.r,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${AppLocalizations.of(context)!.iAgreeToAll} ',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp,
                    color: AppColors.GRAY,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => AppHelpers.navigationToPage(
                          context,
                          const Scaffold(),
                        ),
                  text: AppLocalizations.of(context)!.theTermsAndPrivacyPolicy,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.BLACK,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
