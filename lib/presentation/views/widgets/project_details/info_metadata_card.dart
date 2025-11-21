import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

class InfoMetadataCard extends StatelessWidget {
  final String category;
  final String location;
  final String totalArea;
  final String year;

  const InfoMetadataCard({
    super.key,
    required this.category,
    required this.location,
    required this.totalArea,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      width: 280,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(

        children: [
          // العمود البرتقالي على اليسار
          Positioned(
            right: 0.5,
            top: 16,
            bottom: 14,
            child: Container(
              width: 6,
              decoration: BoxDecoration(
                color: AppColors.primary,  // اللون البرتقالي
                // color: Color(0xFFFF6B4A),  // اللون البرتقالي
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding:   EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'تصنيف المشروع',
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),

                _InfoRow(label: 'النوع', value: category),
                const SizedBox(height: 16),

                _InfoRow(label: 'الموقع', value: location),
                const SizedBox(height: 16),

                _InfoRow(label: 'المساحة الإجمالية', value: totalArea),
                const SizedBox(height: 16),

                _InfoRow(label: 'السنة', value: year),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: Colors.white60,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
