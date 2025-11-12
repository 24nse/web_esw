// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:web_site/theme/tokens.dart';
//
// class PlanCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String price;
//   final List<String> features;
//   final bool highlighted;
//   final VoidCallback? onAction;
//   final String actionLabel;
//   const PlanCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.features,
//     this.highlighted = false,
//     this.onAction,
//     this.actionLabel = 'اطلب عرض سعر',
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: highlighted ? AppColors.primary : AppColors.surface,
//         borderRadius: AppRadii.lg,
//         border: Border.all(color: highlighted ? Colors.transparent : AppColors.border),
//         boxShadow: AppShadows.card,
//       ),
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.cairo(
//               fontSize: 20,
//               fontWeight: FontWeight.w800,
//               color: highlighted ? Colors.white : AppColors.text,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             description,
//             style: GoogleFonts.cairo(
//               fontSize: 14,
//               color: highlighted ? Colors.white70 : AppColors.textMuted,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             price,
//             style: GoogleFonts.cairo(
//               fontSize: 28,
//               fontWeight: FontWeight.w800,
//               color: highlighted ? Colors.white : AppColors.text,
//             ),
//           ),
//           const SizedBox(height: 16),
//           ...features.map((f) => Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(Icons.check_circle, size: 18, color: highlighted ? Colors.white : AppColors.success),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         f,
//                         style: GoogleFonts.cairo(
//                           color: highlighted ? Colors.white : AppColors.text,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )),
//           const Spacer(),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: onAction,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: highlighted ? Colors.white : AppColors.primary,
//               foregroundColor: highlighted ? AppColors.primary : Colors.white,
//               minimumSize: const Size(double.infinity, 48),
//               shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
//             ),
//             child: Text(actionLabel),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:web_site/theme/tokens.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final List<String> features;
  final bool highlighted;
  final VoidCallback? onAction;
  final String actionLabel;

  const PlanCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.features,
    this.highlighted = false,
    this.onAction,
    this.actionLabel = 'اطلب عرض سعر',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: highlighted ? AppColors.primary : AppColors.surface,
        borderRadius: AppRadii.lg,
        border: Border.all(
          color: highlighted ? Colors.transparent : AppColors.border,
        ),
        boxShadow: AppShadows.card,
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: "Cairo", // 👈 خط محلي
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 14,
              color: highlighted ? Colors.white70 : AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            price,
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: highlighted ? Colors.white : AppColors.text,
            ),
          ),
          const SizedBox(height: 16),
          ...features.map(
                (f) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 18,
                    color: highlighted ? Colors.white : AppColors.success,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      f,
                      style: TextStyle(
                        fontFamily: "Cairo",
                        color: highlighted ? Colors.white : AppColors.text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onAction,
            style: ElevatedButton.styleFrom(
              backgroundColor:
              highlighted ? Colors.white : AppColors.primary,
              foregroundColor:
              highlighted ? AppColors.primary : Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
            ),
            child: Text(
              actionLabel,
              style: const TextStyle(fontFamily: "Cairo"), // 👈 حتى الزر
            ),
          ),
        ],
      ),
    );
  }
}
