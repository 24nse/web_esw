
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
              style: TextStyle(
                fontFamily: "Cairo",
                color: Color(0xFF6B7280),
                fontSize: 16,
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
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
            children: [
              TextSpan(
                text: des1,
                style: TextStyle(
                    fontFamily: "Cairo",
                    color:colordse1?? Color(0xFF0A1E4D)),
              ),
              TextSpan(
                text: des2,
                style: TextStyle(
                    fontFamily: "Cairo",
                    color:colordse2 ?? AppColors.primary),
              ),
            ],
          ),
        ),

      ],
    );

  }
}
