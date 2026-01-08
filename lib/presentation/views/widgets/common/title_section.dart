import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';
import 'package:web_site/core/responsive/responsive.dart'; // ✅ your helper

class TitleSection extends StatelessWidget {
  final String title;
  final String? des1;
  final String? des2;
  final Color? colordse1;
  final Color? colordse2;

  const TitleSection({
    super.key,
    required this.title,
    this.des1,
    this.des2,
    this.colordse1,
    this.colordse2,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final lineWidth = Responsive.value<double>(
      context: context,
      mobile: 28,
      tablet: 40,
      desktop: 50,
    );

    final gap = Responsive.value<double>(
      context: context,
      mobile: 8,
      tablet: 10,
      desktop: 10,
    );

    final space = Responsive.value<double>(
      context: context,
      mobile: 10,
      tablet: 15,
      desktop: 15,
    );

    final smallTitleFont = Responsive.value<double>(
      context: context,
      mobile: 8,
      tablet: 14,
      desktop: 14,
    );

    final headingFont = Responsive.value<double>(
      context: context,
      mobile: 12,
      tablet: 28,
      desktop: 34,
    );

    final headingStyle = AppStyles.styleBold32(context).copyWith(
      height: 1.3,
    );

    return Column(
      children: [

        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [

            Container(width: lineWidth, height: 2, color: AppColors.primary),
            AppText(
              title,
              style: AppStyles.styleMedium16(context).copyWith(
                color: const Color(0xFF6B7280),
                fontSize: getResponsiveFontSize(context, fontSize: 12)
              ),
            ),
            Container(width: lineWidth, height: 2, color: AppColors.primary),
          ],
        ),
        SizedBox(height: space),
        AppText.rich(
          TextSpan(
            style: headingStyle,
            children: [
              TextSpan(
                text: des1 ?? '',
                style:AppStyles.styleBold18(context).copyWith(
                  color: colordse1 ?? const Color(0xFF0A1E4D),
                    fontSize: getResponsiveFontSize(context, fontSize: 18)

                ),
              ),
              TextSpan(
                text: des2 ?? '',
                style:AppStyles.styleBold18(context).copyWith(
                  color: colordse2 ?? AppColors.primary,
                    fontSize: getResponsiveFontSize(context, fontSize: 18)

                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}


//
// import 'package:flutter/material.dart';
// import 'package:web_site/common/constants/theme/tokens.dart';
// import 'package:web_site/presentation/views/widgets/common/app_text.dart';
//
// class TitleSection extends StatelessWidget {
//   final String title;
//   final String? des1;
//   final String? des2;
//  final Color? colordse1;
// final  Color? colordse2;
//   const TitleSection({super.key, required this.title,  this.des1,  this.des2, this.colordse1, this.colordse2});
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final headingStyle = textTheme.headlineLarge?.copyWith(height: 1.3);
//     return  Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 50,
//               height: 2,
//               color: AppColors.primary,
//             ),
//             SizedBox(width: 10),
//             AppText(
//              title,
//               style: textTheme.bodyMedium?.copyWith(
//                 color: const Color(0xFF6B7280),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(width: 10),
//             Container(
//               width: 50,
//               height: 2,
//               color: AppColors.primary,
//             ),
//           ],
//         ),
//         SizedBox(height: 15),
//         // العنوان الرئيسي
//         AppText.rich(
//           TextSpan(
//             style: headingStyle,
//             children: [
//               TextSpan(
//                 text: des1,
//                 style: headingStyle?.copyWith(color: colordse1 ?? const Color(0xFF0A1E4D)),
//               ),
//               TextSpan(
//                 text: des2,
//                 style: headingStyle?.copyWith(color: colordse2 ?? AppColors.primary),
//               ),
//             ],
//           ),
//           textAlign: TextAlign.center,
//         ),
//
//       ],
//     );
//
//   }
// }
//
//
