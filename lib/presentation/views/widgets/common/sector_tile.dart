// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:web_site/common/constants/theme/tokens.dart';
//
// class SectorTile extends StatelessWidget {
//   final String title;
//   final String meta;
//   final IconData icon;
//   const SectorTile({super.key, required this.title, required this.meta, this.icon = Icons.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       decoration: BoxDecoration(
//         color: AppColors.bg,
//         borderRadius: AppRadii.md,
//         border: Border.all(color: AppColors.border),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: AppGradients.hero,
//             ),
//             child: Icon(icon, color: Colors.white),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.cairo(
//                     fontWeight: FontWeight.w800,
//                     color: AppColors.text,
//                   ),
//                 ),
//                 Text(meta, style: GoogleFonts.cairo(color: AppColors.textMuted)),
//               ],
//             ),
//           ),
//           const Icon(Icons.chevron_right, color: Colors.black26),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';

class SectorTile extends StatelessWidget {
  final String title;
  final String meta;
  final IconData icon;

  const SectorTile({
    super.key,
    required this.title,
    required this.meta,
    this.icon = Icons.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.bgG,
        borderRadius: AppRadii.md,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppGradients.hero,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title,
                  style: AppStyles.styleBold16(context).copyWith(
                    color: AppColors.text,
                  ),
                ),
                AppText(
                  meta,
                  style: AppStyles.styleRegular14(context).copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.black26),
        ],
      ),
    );
  }
}


