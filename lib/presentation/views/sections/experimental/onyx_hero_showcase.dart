// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
//
// class OnyxHeroSection extends StatelessWidget {
//   const OnyxHeroSection({super.key});
//
//   // ألوان تصميم الصورة
//   static const Color _blue = Color(0xFF0A2A5A);
//   static const Color _orange = Color(0xFFFB6A1F);
//   static const Color _muted = Color(0xFFE9EEF3);
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       final isNarrow = constraints.maxWidth < 900;
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // top ruler / thin decorative bar
//           Container(
//             height: 18,
//             decoration: const BoxDecoration(
//               color: Color(0xFFF7F9FB),
//             ),
//             child: CustomPaint(
//               painter: _RulerPainter(),
//               size: Size(constraints.maxWidth, 18),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // headline + chips + right short paragraph (on wide screens side-by-side)
//           if (!isNarrow)
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // left column: title + chips
//                 Expanded(
//                   flex: 6,
//                   child: _TitleAndChips(),
//                 ),
//
//                 const SizedBox(width: 28),
//
//                 // right column: small paragraph + circular logo
//                 Expanded(
//                   flex: 4,
//                   child: _IntroCard(),
//                 ),
//               ],
//             )
//           else
//             Column(
//               children: [
//                 _TitleAndChips(),
//                 const SizedBox(height: 16),
//                 _IntroCard(),
//               ],
//             ),
//
//           const SizedBox(height: 22),
//
//           // main content: image + orange stats card
//           isNarrow ? _buildStackForNarrow(context) : _buildStackForWide(context),
//         ],
//       );
//     });
//   }
//
//   Widget _buildStackForWide(BuildContext context) {
//     return SizedBox(
//       height: 320,
//       child: Row(
//         children: [
//           // left: large image with rounded corners and play icon
//           Expanded(
//             flex: 7,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.asset(
//                     'assets/images/c.png',
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                 ),
//                 // play circle
//                 Positioned.fill(
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       width: 72,
//                       height: 72,
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.9),
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.15),
//                             blurRadius: 12,
//                             offset: const Offset(0, 6),
//                           ),
//                         ],
//                       ),
//                       child: const Icon(Icons.play_arrow, color: Color(0xFF0A2A5A), size: 40),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(width: 18),
//
//           // right: orange stats card aligned vertically center of image
//           Expanded(
//             flex: 3,
//             child: Center(
//               child: _OrangeStatsCard(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStackForNarrow(BuildContext context) {
//     // On mobile stack image then stats overlay at bottom-right
//     return SizedBox(
//       height: 420,
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 'assets/images/p.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             right: 16,
//             bottom: 16,
//             child: _OrangeStatsCard(width: 220),
//           ),
//           Positioned.fill(
//             child: Align(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 68,
//                 height: 68,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.92),
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.12),
//                       blurRadius: 10,
//                       offset: const Offset(0, 6),
//                     ),
//                   ],
//                 ),
//                 child: const Icon(Icons.play_arrow, color: Color(0xFF0A2A5A), size: 36),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _TitleAndChips extends StatelessWidget {
//   const _TitleAndChips({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const mainBlue = Color(0xFF0A2A5A);
//     const accentOrange = Color(0xFFFB6A1F);
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'تميز تنفيذي في الإنشاءات',
//           style: TextStyle(
//             color: accentOrange,
//             fontSize: 14,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         const SizedBox(height: 8),
//         // big two-line headline (Arabic)
//         RichText(
//           text: TextSpan(
//             style: TextStyle(color: mainBlue, height: 1.05),
//             children: [
//               TextSpan(
//                 text: 'أين يقود الابتكار\n',
//                 style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//               ),
//               TextSpan(
//                 text: 'نحو الكمال الإنشائي',
//                 style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: accentOrange),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),
//         // chips
//         Wrap(
//           runSpacing: 8,
//           spacing: 10,
//           children: const [
//             _TagChip(label: 'خدمات الإنشاء العامة'),
//             _TagChip(label: 'أعمال الخرسانة'),
//             _TagChip(label: 'التصميم والتخطيط'),
//             _TagChip(label: 'الأعمال المدنية'),
//             _TagChip(label: 'ما قبل البناء'),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class _TagChip extends StatelessWidget {
//   final String label;
//   const _TagChip({required this.label, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 3)),
//         ],
//         border: Border.all(color: const Color(0xFFE0E6EE)),
//       ),
//       child: Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF0A2A5A))),
//     );
//   }
// }
//
// class _IntroCard extends StatelessWidget {
//   const _IntroCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // right: small logo circle
//         Container(
//           width: 72,
//           height: 72,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(999),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8)],
//             image: const DecorationImage(
//               image: AssetImage('assets/images/c.png'),
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         const SizedBox(width: 14),
//         // left: short paragraph
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               SizedBox(height: 6),
//               Text(
//                 'شركة رائدة في تنفيذ المشاريع السكنية والتجارية مع التركيز على الجودة والابتكار لتقديم أفضل الحلول.',
//                 style: TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF58708A)),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class _OrangeStatsCard extends StatelessWidget {
//   final double? width;
//   const _OrangeStatsCard({this.width, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const orange = Color(0xFFFB6A1F);
//     const darkText = Color(0xFFFFFFFF);
//
//     return Container(
//       width: width ?? 220,
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: orange,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 18, offset: const Offset(0, 8)),
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           _StatItem(number: '640+', label: 'مشروع مُنجز'),
//           SizedBox(height: 14),
//           _StatItem(number: '25+', label: 'سنة خبرة'),
//           SizedBox(height: 14),
//           _StatItem(number: '450+', label: 'عملاء راضون'),
//         ],
//       ),
//     );
//   }
// }
//
// class _StatItem extends StatelessWidget {
//   final String number;
//   final String label;
//   const _StatItem({required this.number, required this.label, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(number, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
//         const SizedBox(width: 10),
//         Expanded(child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 14))),
//       ],
//     );
//   }
// }
//
// /// simple decorative ruler painter
// class _RulerPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = const Color(0xFFE6EBF3);
//     final stripe = Paint()..color = const Color(0xFFDEE8F3);
//     canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
//
//     final tickPaint = Paint()..color = const Color(0xFFBFD2E8);
//     for (double x = 0; x < size.width; x += 16) {
//       final h = (x % 80 == 0) ? size.height * 0.8 : size.height * 0.45;
//       canvas.drawLine(Offset(x, size.height), Offset(x, size.height - h), tickPaint..strokeWidth = 1.2);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
//
//
// class ConstructionHeroPage extends StatefulWidget {
//   const ConstructionHeroPage({Key? key}) : super(key: key);
//
//   @override
//   State<ConstructionHeroPage> createState() => _ConstructionHeroPageState();
// }
//
// class _ConstructionHeroPageState extends State<ConstructionHeroPage>
//     with TickerProviderStateMixin {
//   late AnimationController _rotationController;
//   late AnimationController _fadeController;
//   late AnimationController _scaleController;
//
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // دوران دائرة "تواصل معنا"
//     _rotationController = AnimationController(
//       duration: const Duration(seconds: 20),
//       vsync: this,
//     )..repeat();
//
//     // Fade in animation
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );
//     _fadeAnimation = CurvedAnimation(
//       parent: _fadeController,
//       curve: Curves.easeIn,
//     );
//
//     // Scale animation
//     _scaleController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _scaleAnimation = CurvedAnimation(
//       parent: _scaleController,
//       curve: Curves.elasticOut,
//     );
//
//     _fadeController.forward();
//     _scaleController.forward();
//   }
//
//   @override
//   void dispose() {
//     _rotationController.dispose();
//     _fadeController.dispose();
//     _scaleController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child:  Container(
//         height: 800,
//         color: Color(0xFFf2f4f5),
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: Column(
//                   children: [
//                     // القسم العلوي - أبيض
//                     _buildTopSection(),
//                     // القسم السفلي - أزرق
//                     _buildBottomSection(),
//                   ],
//                 ),
//             ),
//         Positioned(
//           top: 260,
//           right: 30,
//           child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // النجوم الزخرفية
//               // const DecorativeStars(),
//               // const SizedBox(width: 60),
//
//               // صورة فريق العمل
//                ScaleTransition(
//                   scale: _scaleAnimation,
//                   child: _buildImageCard(),
//                 ),
//
//               const SizedBox(width: 40),
//
//               // بطاقة الإحصائيات
//               ScaleTransition(
//                 scale: _scaleAnimation,
//                 child: const StatsCard(),
//               ),
//             ],
//           ),
//         ),
//         ),
//           Positioned(
//             top: 450,
//             right: 13,
//             child:  const DecorativeStars(),)
//           ],
//         ),
//       ),
//
//     );
//   }
//
//   Widget _buildTopSection() {
//     return Container(
//       height: 400,
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // عنوان صغير مع حد برتقالي
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//
//                 children: [
//                   FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 4,
//                           height: 24,
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFFF6B2C),
//                             borderRadius: BorderRadius.circular(2),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         const Text(
//                           'التميز في البناء الحائز على الجوائز',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: "Cairo"
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//
//                   // العنوان الرئيسي
//                   FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'حيث يقود الابتكار إلى',
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: const Color(0xFF001F5C),
//                               height: 1.2,
//                               fontFamily: "Cairo"
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         ShaderMask(
//                           shaderCallback: (bounds) => const LinearGradient(
//                             colors: [Color(0xFFFF6B2C), Color(0xFFFF8A5C)],
//                           ).createShader(bounds),
//                           child: Text(
//                             'الكمال الإنشائي',
//                             style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 height: 1.2,
//                                 fontFamily: "Cairo"
//
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                 ],
//               ),
//               ContainerCircleHeader(controller: _rotationController),
//             ],
//           ),
//           const SizedBox(height: 30),
//
//
//
//           // أزرار الخدمات والوصف
//           ScaleTransition(
//             scale: _scaleAnimation,
//             child: Row(
//
//               children: [
//                 Wrap(
//                     spacing: 16,
//                     runSpacing: 16,
//
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                   children: [
//                     _buildServiceButton('خدمات البناء العامة'),
//                     _buildServiceButton('أعمال الخرسانة'),
//                     _buildServiceButton('التصميم والتخطيط'),
//                     _buildServiceButton('الأعمال المدنية'),
//                     _buildServiceButton('ما قبل البناء'),
//                   ],
//             ),
//
//
//                 // فاصل عمودي
//                 Container(
//                   height: 50,
//                   width: 2,
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         const Color(0xFFFF6B2C).withOpacity(0.2),
//                         const Color(0xFFFF6B2C),
//                         const Color(0xFFFF6B2C).withOpacity(0.2),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 // النص الوصفي
//                 SizedBox(
//                   width: 450,
//                   child: Text(
//                     'نحن نقدم حلولاً متكاملة في مجال المقاولات والعقارات مع التزام كامل بالجودة والابتكار لتحقيق رؤيتكم الإنشائية بأعلى المعايير العالمية',
//                     style: TextStyle(
//                       color: Colors.grey[700],
//                       fontSize: 14,
//                       height: 1.6,
//                       fontFamily: "Cairo"
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildServiceButton(String text) {
//     return AnimatedServiceButton(text: text);
//   }
//
//   Widget _buildBottomSection() {
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//         color: const Color(0xFF001F5C),
//         image: DecorationImage(
//           image: const AssetImage('assets/images/c.png'),
//           fit: BoxFit.cover,
//           opacity: 0.05,
//
//         ),
//       ),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // خطوط قطرية في الخلفية
//           Positioned.fill(
//             child: CustomPaint(
//               painter: DiagonalLinesPainter(),
//             ),
//           ),
//
//
//           // دائرة "تواصل معنا" الدوارة
//           Positioned(
//             top: -50,
//             left: 40,
//             child: RotatingContactCircle(controller: _rotationController),
//           ),
//
//           // خطوط مائلة في الركن السفلي
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: CustomPaint(
//               size: const Size(300, 120),
//               painter: BottomDiagonalPainter(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImageCard() {
//     return Container(
//       height: 250,
//       width: 500,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(32),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 40,
//             offset: const Offset(0, 20),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Stack(
//           fit: StackFit.expand, // ✅ تجعل العناصر تملأ كامل المساحة
//
//
//           children: [
//             // صورة الخلفية
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Colors.grey[300]!,
//                     Colors.grey[400]!,
//                     Colors.grey[500]!,
//                   ],
//                 ),
//               ),
//               child: Image.asset("assets/images/c.png", fit: BoxFit.fill,),
//             ),
//
//           Center(
//                 child: PlayButton(),
//
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // زر الخدمة مع تأثير Hover
// class AnimatedServiceButton extends StatefulWidget {
//   final String text;
//
//   const AnimatedServiceButton({Key? key, required this.text}) : super(key: key);
//
//   @override
//   State<AnimatedServiceButton> createState() => _AnimatedServiceButtonState();
// }
//
// class _AnimatedServiceButtonState extends State<AnimatedServiceButton> {
//   bool _isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//         decoration: BoxDecoration(
//           color: _isHovered ? const Color(0xFFFF6B2C).withOpacity(0.1) : Colors.white,
//           border: Border.all(
//             color: _isHovered ? const Color(0xFFFF6B2C) : Colors.grey[300]!,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: _isHovered
//               ? [
//             BoxShadow(
//               color: const Color(0xFFFF6B2C).withOpacity(0.3),
//               blurRadius: 12,
//               offset: const Offset(0, 4),
//             ),
//           ]
//               : [],
//         ),
//         child: Text(
//           widget.text,
//           style: TextStyle(
//             color: _isHovered ? const Color(0xFFFF6B2C) : Colors.grey[700],
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//             fontFamily: "Cairo"
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // بطاقة الإحصائيات
// class StatsCard extends StatelessWidget {
//   const StatsCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 250,
//       width: 250,
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Color(0xFFFF6B2C), Color(0xFFFF8A5C)],
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFFFF6B2C).withOpacity(0.5),
//             blurRadius: 30,
//             offset: const Offset(0, 15),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildStatItem('640+', 'مشروع مكتمل'),
//           _buildDivider(),
//           _buildStatItem('25+', 'سنة من الخبرة'),
//           _buildDivider(),
//           _buildStatItem('450+', 'عميل '),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatItem(String number, String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TweenAnimationBuilder<double>(
//             tween: Tween(begin: 0, end: 1),
//             duration: const Duration(milliseconds: 1500),
//             curve: Curves.elasticOut,
//             builder: (context, value, child) {
//               return Transform.scale(
//                 scale: value,
//                 child: child,
//               );
//             },
//             child: Text(
//               number,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                   fontFamily: "Cairo"
//
//               ),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Colors.white,
//               fontWeight: FontWeight.w500,
//               fontFamily: "Cairo"
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDivider() {
//     return Container(
//       height: 1,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.white.withOpacity(0),
//             Colors.white.withOpacity(0.5),
//             Colors.white.withOpacity(0),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // دائرة "تواصل معنا" الدوارة
// class RotatingContactCircle extends StatelessWidget {
//   final AnimationController controller;
//
//   const RotatingContactCircle({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 120,
//       width: 120,
//       child: Stack(
// alignment: Alignment.center,
//         children: [
//
//
//           // الدائرة الخارجية الدوارة
//           AnimatedBuilder(
//             animation: controller,
//             builder: (context, child) {
//               return Transform.rotate(
//                 angle: controller.value * 2 * math.pi,
//                 child: child,
//               );
//             },
//             child: Container(
//               height: 120,
//               width: 120,
//
//               decoration: BoxDecoration(
//
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: Color(0xFF001F5C).withOpacity(0.3),
//                   width: 2,
//                   strokeAlign: BorderSide.strokeAlignOutside,
//                 ),
//               ),
//             ),
//           ),
//
//           // الدائرة الداخلية
//           Container(
//             width: 120,
//             height: 120,
//             decoration: BoxDecoration(
//               color: const Color(0xFF001F5C),
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white, width: 4),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 20,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFFF6B2C),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'تواصل',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const Text(
//                   'معنا',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class ContainerCircleHeader extends StatelessWidget {
//   final AnimationController controller;
//
//   const ContainerCircleHeader({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//
//         // الدائرة الخارجية الدوارة
//         // AnimatedBuilder(
//         //   animation: controller,
//         //   builder: (context, child) {
//         //     return Transform.rotate(
//         //       angle: controller.value * 2 * math.pi,
//         //       child: child,
//         //     );
//         //   },
//         //   child:
//       Container(
//             height: 120,
//             width: 120,
//
//             decoration: BoxDecoration(
//               image: DecorationImage(image:AssetImage("assets/images/i1.png"),fit: BoxFit.cover ),
//               shape: BoxShape.circle,
//               // border: Border.all(
//               //   color: Color(0xFF001F5C).withOpacity(0.3),
//               //   width: 2,
//               //   strokeAlign: BorderSide.strokeAlignOutside,
//               // ),
//             ),
//           // ),
//         ),
//
//         // الدائرة الداخلية
//         Positioned(
//           left: 50,
//           child: Container(
//             width: 120,
//             height: 120,
//             decoration: BoxDecoration(
//               color:  Colors.white,
//               // color: const Color(0xFF001F5C),
//
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white, width: 4),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 20,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Container(
//               child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,),
//             ),
//             // child: Column(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   children: [
//             //     Container(
//             //       width: 40,
//             //       height: 40,
//             //       decoration: const BoxDecoration(
//             //         color: Color(0xFFFF6B2C),
//             //         shape: BoxShape.circle,
//             //       ),
//             //       child: const Icon(
//             //         Icons.arrow_back,
//             //         color: Colors.white,
//             //         size: 20,
//             //       ),
//             //     ),
//             //     const SizedBox(height: 8),
//             //     const Text(
//             //       'تواصل',
//             //       style: TextStyle(
//             //         color: Colors.black,
//             //         fontSize: 12,
//             //         fontWeight: FontWeight.bold,
//             //       ),
//             //     ),
//             //     const Text(
//             //       'معنا',
//             //       style: TextStyle(
//             //         color: Colors.black,
//             //         fontSize: 10,
//             //         fontWeight: FontWeight.w500,
//             //       ),
//             //     ),
//             //   ],
//             // ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // زر التشغيل
// class PlayButton extends StatefulWidget {
//   const PlayButton({Key? key}) : super(key: key);
//
//   @override
//   State<PlayButton> createState() => _PlayButtonState();
// }
//
// class _PlayButtonState extends State<PlayButton> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   bool _isHovered = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) {
//         setState(() => _isHovered = true);
//         _controller.forward();
//       },
//       onExit: (_) {
//         setState(() => _isHovered = false);
//         _controller.reverse();
//       },
//       child: GestureDetector(
//         onTap: () {},
//         child: ScaleTransition(
//           scale: _scaleAnimation,
//           child: Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.3),
//               border: Border.all(color: Colors.white, width: 1),
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   blurRadius: 20,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: const Icon(
//               Icons.play_arrow,
//               color: Color(0xFFFF6B2C),
//
//               size: 30,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // النجوم الزخرفية
// class DecorativeStars extends StatelessWidget {
//   const DecorativeStars({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 100,
//       height: 150,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 30,
//             right: 40,
//             child: _buildStar(60, const Color(0xFFFF6B2C)),
//           ),
//           Positioned(
//             top: 80,
//             left: 60,
//             child: _buildStar(25, const Color(0xFFFF6B2C)),
//           ),
//           Positioned(
//             top: 20,
//             left: 70,
//             child: _buildStar(40, const Color(0xFFFF6B2C)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStar(double size, Color color) {
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0, end: 1),
//       duration: Duration(milliseconds: 800 + (size * 10).toInt()),
//       curve: Curves.elasticOut,
//       builder: (context, value, child) {
//         return Transform.scale(
//           scale: value,
//           child: child,
//         );
//       },
//       child: CustomPaint(
//         size: Size(size, size),
//         painter: StarPainter(color: color),
//       ),
//     );
//   }
// }
//
// // رسام النجوم
// class StarPainter extends CustomPainter {
//   final Color color;
//
//   StarPainter({required this.color});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;
//
//     final path = Path();
//     final w = size.width;
//     final h = size.height;
//
//     path.moveTo(w / 2, 0);
//     path.lineTo(w * 0.6, h * 0.4);
//     path.lineTo(w, h / 2);
//     path.lineTo(w * 0.6, h * 0.6);
//     path.lineTo(w / 2, h);
//     path.lineTo(w * 0.4, h * 0.6);
//     path.lineTo(0, h / 2);
//     path.lineTo(w * 0.4, h * 0.4);
//     path.close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
//
// // رسام الخطوط القطرية
// class DiagonalLinesPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.05)
//       ..strokeWidth = 1;
//
//     for (double i = -size.height; i < size.width + size.height; i += 20) {
//       canvas.drawLine(
//         Offset(i, 0),
//         Offset(i + size.height, size.height),
//         paint,
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
//
// // رسام الخطوط السفلية
// class BottomDiagonalPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFFFF6B2C).withOpacity(0.15)
//       ..strokeWidth = 8;
//
//     for (double i = 0; i < size.width + size.height; i += 16) {
//       canvas.drawLine(
//         Offset(size.width - i, size.height),
//         Offset(size.width - i + size.height, 0),
//         paint,
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }