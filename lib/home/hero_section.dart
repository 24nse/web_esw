// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:web_site/theme/tokens.dart';
// //
// // class HeroSection extends StatelessWidget {
// //   const HeroSection({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container
// //     (
// //       decoration: const BoxDecoration(
// //         image: DecorationImage(
// //           image: AssetImage('assets/images/background.png'),
// //           fit: BoxFit.cover,
// //         ),
// //         gradient: AppGradients.hero,
// //       ),
// //       padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
// //       child: SingleChildScrollView(
// //         padding: const EdgeInsets.only(bottom: 16),
// //         child: Center(
// //           child: ConstrainedBox(
// //             constraints: const BoxConstraints(maxWidth: 1200),
// //             child: Row(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 // Text side
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'نبني أحلامكم ونُنجز مشاريعكم باحترافية',
// //                         // style: GoogleFonts.cairo(
// //                         //   fontSize: 40,
// //                         //   fontWeight: FontWeight.w800,
// //                         //   color: Colors.white,
// //                         //   height: 1.2,
// //                         // ),
// //                       ),
// //                       const SizedBox(height: 16),
// //                       Text(
// //                         'شركة متخصصة في المقاولات العامة وتطوير العقارات؛ تنفيذ وتشطيب وصيانة وإدارة أملاك بمعايير جودة عالية ومواعيد دقيقة.',
// //                         style: GoogleFonts.cairo(
// //                           fontSize: 18,
// //                           color: Colors.white.withOpacity(0.95),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 24),
// //                       Wrap(
// //                         spacing: 12,
// //                         runSpacing: 12,
// //                         children: [
// //                           ElevatedButton(
// //                             onPressed: () {},
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor: Colors.white,
// //                               foregroundColor: AppColors.primaryDark,
// //                               padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
// //                               shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
// //                             ),
// //                             child: const Text('اطلب عرض سعر'),
// //                           ),
// //                           OutlinedButton(
// //                             onPressed: () {},
// //                             style: OutlinedButton.styleFrom(
// //                               foregroundColor: Colors.white,
// //                               side: const BorderSide(color: Colors.white70),
// //                               padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
// //                               shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
// //                             ),
// //                             child: const Text('تواصل معنا'),
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 24),
// //                       Row(
// //                         children: [
// //                           _StatItem(title: 'سنوات خبرة', value: '15+'),
// //                           _Divider(),
// //                           _StatItem(title: 'مشاريع مكتملة', value: '300+'),
// //                           _Divider(),
// //                           _StatItem(title: 'عملاء راضون', value: '200+'),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(width: 24),
// //                 // Image placeholder
// //                 Expanded(
// //                   child: AspectRatio(
// //                     aspectRatio: 4/3,
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         color: Colors.white.withOpacity(0.1),
// //                         borderRadius: AppRadii.lg,
// //                         border: Border.all(color: Colors.white24),
// //                       ),
// //                       child: const Center(
// //                         child: Icon(Icons.school, size: 96, color: Colors.white70),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class _StatItem extends StatelessWidget {
// //   final String title;
// //   final String value;
// //   const _StatItem({required this.title, required this.value});
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             value,
// //             style: GoogleFonts.cairo(
// //               color: Colors.white,
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           Text(
// //             title,
// //             style: GoogleFonts.cairo(
// //               color: Colors.white70,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class _Divider extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 28,
// //       width: 1,
// //       color: Colors.white24,
// //       margin: const EdgeInsets.symmetric(horizontal: 8),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:web_site/theme/tokens.dart';
//
// class HeroSection extends StatelessWidget {
//   const HeroSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/background.png'),
//           fit: BoxFit.cover,
//         ),
//         gradient: AppGradients.hero,
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 60),
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.only(bottom: 16),
//         child:  Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Text side
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'نبني أحلامكم ونُنجز مشاريعكم باحترافية',
//                         style: const TextStyle(
//                           fontFamily: 'Cairo',
//                           fontSize: 40,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white,
//                           height: 1.2,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'شركة متخصصة في المقاولات العامة وتطوير العقارات؛ تنفيذ وتشطيب وصيانة وإدارة أملاك بمعايير جودة عالية ومواعيد دقيقة.',
//                         style: TextStyle(
//                           fontFamily: 'Cairo',
//                           fontSize: 18,
//                           color: Colors.white.withOpacity(0.95),
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       Wrap(
//                         spacing: 12,
//                         runSpacing: 12,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               foregroundColor: AppColors.primaryDark,
//                               padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//                               shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
//                             ),
//                             child: const Text('اطلب عرض سعر', style: TextStyle(fontFamily: 'Cairo')),
//                           ),
//                           OutlinedButton(
//                             onPressed: () {},
//                             style: OutlinedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               side: const BorderSide(color: Colors.white70),
//                               padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//                               shape: RoundedRectangleBorder(borderRadius: AppRadii.sm),
//                             ),
//                             child: const Text('تواصل معنا', style: TextStyle(fontFamily: 'Cairo')),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       Row(
//                         children: const [
//                           _StatItem(title: 'سنوات خبرة', value: '15+'),
//                           _Divider(),
//                           _StatItem(title: 'مشاريع مكتملة', value: '300+'),
//                           _Divider(),
//                           _StatItem(title: 'عملاء راضون', value: '200+'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 24),
//                 // Image placeholder
//                 Expanded(
//                   child: AspectRatio(
//                     aspectRatio: 4 / 3,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.1),
//                         borderRadius: AppRadii.lg,
//                         border: Border.all(color: Colors.white24),
//                       ),
//                       child: const Center(
//                         child: Icon(Icons.school, size: 96, color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//     );
//   }
// }
//
// class _StatItem extends StatelessWidget {
//   final String title;
//   final String value;
//   const _StatItem({required this.title, required this.value});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             value,
//             style: const TextStyle(
//               fontFamily: 'Cairo',
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             title,
//             style: const TextStyle(
//               fontFamily: 'Cairo',
//               color: Colors.white70,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _Divider extends StatelessWidget {
//   const _Divider({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 28,
//       width: 1,
//       color: Colors.white24,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//     );
//   }
// }
