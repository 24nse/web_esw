import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String subTitle1;
  final void Function()? onTap;
  const SectionTitle({super.key, required this.title, required this.subTitle, required this.subTitle1, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return   Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B2C),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                   AppText(
                    title,
                     style: AppStyles.styleMedium16(context).copyWith(
                       color: Colors.grey,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                ],
              ),
              const SizedBox(height: 30),

              // العنوان الرئيسي
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   AppText(
                     subTitle,
                     useFittedBox: true,
                     alignment: Alignment.centerRight,
                     style: AppStyles.styleBold24(context).copyWith(
                       color: const Color(0xFF001F5C),
                       height: 1.2,
                     ),
                   ),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFFFF6B2C), Color(0xFFFF8A5C)],
                      ).createShader(bounds),
                       child: AppText(
                         subTitle1,
                         style: AppStyles.styleBold24(context).copyWith(
                           color: Colors.white,
                           height: 1.2,
                         ),
                       ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
               child: AppText(
                 "اعرف المزيد",
                 style: AppStyles.styleSemiBold16(context).copyWith(
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0A1E4D), // اللون البرتقالي
              // color: Color(0xFFFF6B4A), // اللون البرتقالي
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      );
  }
}


