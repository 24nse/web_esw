import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';

/// Reusable text field widget for team contact form
class TeamTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool required;
  final TextInputType keyboardType;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TeamTextField({
    super.key,
    required this.label,
    required this.placeholder,
    this.required = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with required indicator
        Row(
          children: [
            Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
            if (required)
               Text(
                ' *',
                style:textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        // Text field
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator ??
              (value) {
                if (required && (value == null || value.isEmpty)) {
                  return 'هذا الحقل مطلوب'; // Arabic validation message
                }
                return null;
              },
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: AppColors.gray.withOpacity(0.6),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.danger,
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
