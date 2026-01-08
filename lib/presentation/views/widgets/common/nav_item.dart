import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/core/app_styles.dart';
import 'package:web_site/presentation/views/widgets/common/app_text.dart';

class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const NavItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onTap,
        child: AppText(
          title,
          style: AppStyles.styleSemiBold16(context).copyWith(
                color: AppColors.text,
              ),
        ),
      ),
    );
  }
}


