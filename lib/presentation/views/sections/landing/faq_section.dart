
// faq_section.dart
import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/widgets/common/universal_service_card.dart';

class FaqSection extends StatefulWidget {
  final Color? backgroundColor;
  const FaqSection({super.key, this.backgroundColor});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  int expandedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    final items = <_FaqItemData>[
      const _FaqItemData('ما الخدمات التي تقدمها مؤسستكم؟', '—', false),
      const _FaqItemData('هل توجد أي تكاليف خفية؟', 'لوريم إيبسوم نص تجريبي يشرح تفاصيل مختصرة عن الرسوم أو البنود المحتملة... هذا النص للعرض فقط.', true),
      const _FaqItemData('كيف يتم تحديد تكلفة المشروع؟', '—', false),
      const _FaqItemData('كيف يمكنني متابعة تقدّم مشروعي؟', '—', false),
      const _FaqItemData('هل تقدّمون استشارات أو تسعيرات مجانية؟', '—', false),
      const _FaqItemData('ما أنواع المشاريع التي تتخصصون بها؟', '—', false),
    ];

    return LightSection(
      backgroundColor: widget.backgroundColor,
      sectionTitle: 'الأسئلة الشائعة',
      titleDescription1: 'سؤال؟',
      titleDescription2: 'انظر هنا.',
      children: [
        if (isMobile)
          Column(
            children: [
              _buildFaqList(items),
              const SizedBox(height: 32),
              const _QuestionsCTA(),
              const SizedBox(height: 16),
              const _ServiceCard(),
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: _buildFaqList(items)),
              const SizedBox(width: 40),
              SizedBox(
                width: isTablet ? 300 : 360,
                child: Column(
                  children: const [
                    _QuestionsCTA(),
                    SizedBox(height: 24),
                    _ServiceCard(),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildFaqList(List<_FaqItemData> items) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          _FaqItem(
            data: items[i],
            index: i,
            isExpanded: expandedIndex == i,
            onTap: () => setState(() => expandedIndex = expandedIndex == i ? -1 : i),
          ),
          if (i < items.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }
}


/* ======================= Widgets: Header Elements ======================= */

/* ======================= Widgets: FAQ List / Item ======================= */

class _FaqItemData {
  final String title;
  final String preview;
  final bool sampleHasBody;
  const _FaqItemData(this.title, this.preview, this.sampleHasBody);
}

class _FaqItem extends StatefulWidget {
  final _FaqItemData data;
  final int index;
  final bool isExpanded;
  final VoidCallback onTap;

  const _FaqItem({
    required this.data,
    required this.index,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    const Color navy = Color(0xFF0C2754);

    final bool expanded = widget.isExpanded;
    final Color bg = expanded ? navy : Colors.white;
    final Color textColor = expanded ? Colors.white : navy;
    final Color iconBg = expanded ? Colors.white10 : Colors.white;
    final Color iconColor = expanded ? Colors.white : navy;

    final textTheme = Theme.of(context).textTheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: AppRadii.lg,
          boxShadow: (expanded || _hover) ? AppShadows.card : const [],
          border: Border.all(
            color: expanded ? Colors.transparent : AppColors.border,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpaces.lg,
                vertical: AppSpaces.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان + رمز
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.data.title,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: textColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 34,
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: iconBg,
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(
                            color: expanded ? Colors.white24 : AppColors.border,
                          ),
                        ),
                        child: Icon(
                          expanded ? Icons.remove : Icons.add,
                          size: 20,
                          color: iconColor,
                        ),
                      ),
                    ],
                  ),

                  // النص الداخلي عند الفتح (بطول سطرين تقريبًا)
                  AnimatedCrossFade(
                    crossFadeState: expanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 160),
                    firstChild: Padding(
                      padding: const EdgeInsets.only(
                        top: AppSpaces.sm,
                        right: 2,
                        left: 2,
                        bottom: 2,
                      ),
                      child: Text(
                        'لوريم إيبسوم هو نص افتراضي يُستخدم للمعاينات. '
                            'نشرح هنا بإيجاز الإجابة على السؤال المطروح مع الحفاظ على أسلوب موجز وواضح.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ======================= Widgets: Right Sidebar ======================= */

class _QuestionsCTA extends StatelessWidget {
  const _QuestionsCTA();

  @override
  Widget build(BuildContext context) {
    const Color navy = Color(0xFF0C2754);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: navy,
        borderRadius: AppRadii.lg,
        boxShadow: AppShadows.card,
      ),
      padding: const EdgeInsets.all(AppSpaces.xl),
      child: CustomPaint(
        painter: _StripedBackground(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // فقاعة محادثة برتقالية/بيضاء
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.chat_bubble, color: AppColors.primary, size: 30),
            ),
            const SizedBox(height: AppSpaces.lg),
             Text(
              'لديك أسئلة مختلفة؟',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppSpaces.sm),
            Text(
              "???????? ???????????? ?????? ???????? ???????????\n?????????? ?????????????? ??????????",
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
                height: 1.6,
              ),
            ),
            const SizedBox(height: AppSpaces.lg),
            _PrimaryPillButton(
              label: 'تواصل معنا',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

/// Refactored to use UniversalServiceCard with ServiceCardEntity.simple
class _ServiceCard extends StatelessWidget {
  const _ServiceCard();

  @override
  Widget build(BuildContext context) {
    return UniversalServiceCard(
      entity: ServiceCardEntity.simple(
        icon: Icons.support_agent,
        title: 'خدمة 24/7',
        subtitle: 'راحتكم أولويتنا',
        phoneNumber: '(000) 000-0000',
      ),
    );
  }
}

/* ======================= Shared Widgets ======================= */

class _PrimaryPillButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryPillButton({required this.label, required this.onTap});

  @override
  State<_PrimaryPillButton> createState() => _PrimaryPillButtonState();
}

class _PrimaryPillButtonState extends State<_PrimaryPillButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpaces.lg,
          vertical: AppSpaces.sm,
        ),
        decoration: BoxDecoration(
          color: _hover ? AppColors.primary.withOpacity(.9) : AppColors.primary,
          borderRadius: BorderRadius.circular(999),
          boxShadow: AppShadows.card,
        ),
        child: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

/* ======================= Painter: Diagonal Stripes ======================= */

class _StripedBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..strokeWidth = 2;

    // خطوط مائلة 45°
    const double step = 18;
    for (double x = -size.height; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x + size.height, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}



// import 'package:flutter/material.dart';
//
// import 'package:web_site/common/constants/theme/tokens.dart';
//
// class FAQSection extends StatefulWidget {
//   const FAQSection({Key? key}) : super(key: key);
//
//   @override
//   State<FAQSection> createState() => _FAQSectionState();
// }
//
// class _FAQSectionState extends State<FAQSection> {
//   int? expandedIndex;
//
//   final List<FAQItem> faqs = [
//     FAQItem(
//       question: 'ما هي الخدمات التي تقدمها شركتكم؟',
//       answer:
//       'نقدم مجموعة شاملة من الخدمات تشمل المقاولات العامة، البناء والتشييد، التطوير العقاري، التصميم المعماري، إدارة المشاريع، والصيانة. نعمل على المشاريع السكنية والتجارية والصناعية بأعلى معايير الجودة',
//     ),
//     FAQItem(
//       question: 'هل هناك أي تكاليف خفية؟',
//       answer:
//       'لا، نحن نؤمن بالشفافية الكاملة مع عملائنا. جميع التكاليف يتم توضيحها بشكل تفصيلي في العقد والعرض المالي. لا توجد أي رسوم مخفية أو تكاليف إضافية غير متوقعة',
//     ),
//     FAQItem(
//       question: 'كيف يتم تحديد تكلفة المشروع؟',
//       answer:
//       'يتم تحديد التكلفة بناءً على عدة عوامل: حجم المشروع، المواد المستخدمة، التصميم المطلوب، الموقع الجغرافي، والمدة الزمنية. نقدم تقييماً مجانياً ودراسة جدوى شاملة قبل البدء',
//     ),
//     FAQItem(
//       question: 'كيف يمكنني متابعة تقدم مشروعي؟',
//       answer:
//       'نوفر نظام متابعة إلكتروني متطور يمكنك من خلاله متابعة المشروع في أي وقت. بالإضافة إلى تقارير دورية وزيارات ميدانية منتظمة مع مدير المشروع المخصص لك',
//     ),
//     FAQItem(
//       question: 'هل تقدمون استشارات مجانية أو عروض أسعار؟',
//       answer:
//       'نعم، نقدم استشارة مجانية أولية وعرض سعر تفصيلي دون أي التزام. فريقنا متاح للإجابة على جميع استفساراتكم ومساعدتكم في اتخاذ القرار المناسب',
//     ),
//     FAQItem(
//       question: 'ما أنواع المشاريع التي تتخصصون فيها؟',
//       answer:
//       'نتخصص في المشاريع السكنية (فلل، عمارات، مجمعات)، المشاريع التجارية (مكاتب، محلات، مراكز تسوق)، والمشاريع الصناعية (مصانع، مستودعات). لدينا خبرة واسعة في جميع أنواع المشاريع',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
//       color: AppColors.bgG,
//
//       child: Column(
//         children: [
//           // Header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 500,
//                 height: 2,
//                 color: AppColors.primary,
//               ),
//               SizedBox(width: 10),
//               Text(
//                 'الأسئلة الشائعة',
//                 style: TextStyle(
//,
//                   color: Color(0xFF6B7280),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(width: 10),
//               Container(
//                 width: 500,
//                 height: 2,
//                 color: AppColors.primary,
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 40),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // FAQ List
//               Expanded(
//                 flex: 6,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     // FAQ Items
//                     ...faqs.asMap().entries.map((entry) {
//                       int index = entry.key;
//                       FAQItem faq = entry.value;
//                       bool isExpanded = expandedIndex == index;
//
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 16),
//                         decoration: BoxDecoration(
//                           color: isExpanded
//                               ? const Color(0xFF0A1F44)
//                               : Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 10,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Theme(
//                           data: Theme.of(context).copyWith(
//                             dividerColor: Colors.transparent,
//                           ),
//                           child: ExpansionTile(
//                             tilePadding: const EdgeInsets.symmetric(
//                               horizontal: 24,
//                               vertical: 8,
//                             ),
//                             trailing: Icon(
//                               isExpanded ? Icons.remove : Icons.add,
//                               color: isExpanded
//                                   ? Colors.white
//                                   : const Color(0xFF1A1A2E),
//                               size: 24,
//                             ),
//                             title: Text(
//                               faq.question,
//                               textDirection: TextDirection.rtl,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: isExpanded
//                                     ? Colors.white
//                                     : const Color(0xFF1A1A2E),
//                               ),
//                             ),
//                             onExpansionChanged: (expanded) {
//                               setState(() {
//                                 expandedIndex = expanded ? index : null;
//                               });
//                             },
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
//                                 child: Text(
//                                   faq.answer,
//                                   textDirection: TextDirection.rtl,
//                                   textAlign: TextAlign.right,
//
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white.withOpacity(0.8),
//                                     height: 1.6,
//
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 40),
//               // Contact Cards
//               Expanded(
//                 flex: 4,
//                 child: Column(
//                   children: [
//                     // Questions Card
//                     Container(
//                       padding: const EdgeInsets.all(32),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0A1F44),
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color(0xFF0A1F44).withOpacity(0.3),
//                             blurRadius: 20,
//                             offset: const Offset(0, 10),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               padding: const EdgeInsets.all(20),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFFF6B35),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Icon(
//                                 Icons.chat_bubble_outline,
//                                 color: Colors.white,
//                                 size: 40,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Text(
//                             'لديك أسئلة مختلفة؟',
//                             textDirection: TextDirection.rtl,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Text(
//                             'فريقنا سيجيب على جميع أسئلتك.\nنحن نضمن الرد السريع.',
//                             textDirection: TextDirection.rtl,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white.withOpacity(0.7),
//                               height: 1.6,
//
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 32,
//                               vertical: 14,
//                             ),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFF6B35),
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: const Text(
//                               'تواصل معنا',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     // 24/7 Service Card
//                     Container(
//                       padding: const EdgeInsets.all(24),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.08),
//                             blurRadius: 20,
//                             offset: const Offset(0, 10),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   'اتصل بنا في أي وقت',
//                                   textDirection: TextDirection.rtl,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey[600],
//
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 const Text(
//                                   'خدمة 24/7',
//                                   textDirection: TextDirection.rtl,
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF1A1A2E),
//
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   '966-11-123-4567+',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey[600],
//
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Container(
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFF6B35).withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: const Icon(
//                               Icons.phone_in_talk,
//                               color: Color(0xFFFF6B35),
//                               size: 32,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       )
//     );
//   }
// }
//
// class FAQItem {
//   final String question;
//   final String answer;
//
//   FAQItem({
//     required this.question,
//     required this.answer,
//   });
// }

