
import 'package:flutter/material.dart';

import 'package:web_site/common/constants/theme/tokens.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String? des1;
  final String? des2;
 final Color? colordse1;
final  Color? colordse2;
  const TitleSection({super.key, required this.title,  this.des1,  this.des2, this.colordse1, this.colordse2});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final headingStyle = textTheme.headlineLarge?.copyWith(height: 1.3);
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 2,
              color: AppColors.primary,
            ),
            SizedBox(width: 10),
            Text(
             title,
              style: textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF6B7280),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 50,
              height: 2,
              color: AppColors.primary,
            ),
          ],
        ),
        SizedBox(height: 15),
        // العنوان الرئيسي
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: headingStyle,
            children: [
              TextSpan(
                text: des1,
                style: headingStyle?.copyWith(color: colordse1 ?? const Color(0xFF0A1E4D)),
              ),
              TextSpan(
                text: des2,
                style: headingStyle?.copyWith(color: colordse2 ?? AppColors.primary),
              ),
            ],
          ),
        ),

      ],
    );

  }
}


