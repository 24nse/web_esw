import 'package:flutter/material.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF6B2C), Color(0xFFFF8A5C)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B2C).withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatItem('640+', 'مشروع مكتمل',context ),
          _buildDivider(),
          _buildStatItem('25+', 'سنة من الخبرة',context ),
          _buildDivider(),
          _buildStatItem('450+', 'عميل ',context),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: AppText(
              number,
              style: AppStyles.styleBold16(context).copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 4),
          AppText(
            label,
            style: AppStyles.styleMedium16(context).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0),
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0),
          ],
        ),
      ),
    );
  }
}

