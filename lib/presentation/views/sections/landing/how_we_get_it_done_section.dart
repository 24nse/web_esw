import 'package:flutter/material.dart';

import 'package:web_site/common/constants/theme/tokens.dart';

import '../../widgets/common/section_title.dart';



class HowWeGetItDoneSection extends StatelessWidget {
  const HowWeGetItDoneSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          SectionTitle(
            title:    'كيف نعمل',
            subTitle:'كيف ',
            subTitle1:'ننجز الأمور',

          ),
          const SizedBox(height: 50),
          // Steps Indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              children: [
                _buildStepPill('الخطوة 1', true,context),
                Expanded(child: _buildLine()),
                _buildConnector(true),
                Expanded(child: _buildLine()),
                _buildStepPill('الخطوة 2', false,context),
                Expanded(child: _buildLine()),
                _buildConnector(false),
                Expanded(child: _buildLine()),
                _buildStepPill('الخطوة 3', false,context),
                Expanded(child: _buildLine()),
              ],
            ),
          ),

          // Steps Content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ProcessStep(
                  title: 'الاستشارة\nوالتخطيط',
                  description:
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
                  icon: Icons.people_outline,
                  iconColor: const Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ProcessStep(
                  title: 'التصميم\nوالبناء',
                  description:
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
                  icon: Icons.architecture_outlined,
                  iconColor: const Color(0xFFFF6B35),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ProcessStep(
                  title: 'الفحص النهائي\nوالتسليم',
                  description:
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
                  icon: Icons.task_alt_outlined,
                  iconColor: const Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepPill(String text, bool isActive,BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1A1A2E) : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: isActive ? null : Border.all(color: Colors.grey.shade200),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: const Color(0xFF1A1A2E).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: isActive ? Colors.white : AppColors.primaryDark,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildConnector(bool isActive) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFF6B35) : Colors.white,
        shape: BoxShape.circle,
        border: isActive ? null : Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(
        Icons.keyboard_double_arrow_left,
        color: isActive ? Colors.white : const Color(0xFF1A1A2E),
        size: 16,
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }
}

class ProcessStep extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;

  const ProcessStep({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.gray,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

