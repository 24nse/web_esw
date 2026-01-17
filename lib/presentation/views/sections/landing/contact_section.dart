import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';


import 'package:web_site/common/utils/responsive_helper.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key, this.backgroundColor});
  final Color? backgroundColor;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return LightSection(
      backgroundColor: widget.backgroundColor,
      sectionTitle: 'تواصل معنا',
      titleDescription1: 'هل لديك مشروع؟\n',
      titleDescription2: 'لنتحدث!',
      children: [
        if (isMobile)
          Column(
            children: [
              _buildForm(context),
              const SizedBox(height: 32),
              _buildContactInfo(context),
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _buildForm(context)),
              const SizedBox(width: 40),
              Expanded(flex: 2, child: _buildContactInfo(context)),
            ],
          ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    return Column(
      children: [
        if (isMobile) ...[
          _buildTextField(
            controller: _firstNameController,
            label: 'الاسم الأول *',
            hint: 'مثال: أحمد',
          ),
          const SizedBox(height: 20),
          _buildTextField(
            controller: _lastNameController,
            label: 'اسم العائلة *',
            hint: 'مثال: محمد',
          ),
        ] else
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _firstNameController,
                  label: 'الاسم الأول *',
                  hint: 'مثال: أحمد',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildTextField(
                  controller: _lastNameController,
                  label: 'اسم العائلة *',
                  hint: 'مثال: محمد',
                ),
              ),
            ],
          ),
        const SizedBox(height: 20),
        if (isMobile) ...[
          _buildTextField(
            controller: _emailController,
            label: 'البريد الإلكتروني *',
            hint: 'example@domain.com',
          ),
          const SizedBox(height: 20),
          _buildTextField(
            controller: _phoneController,
            label: 'رقم الهاتف *',
            hint: 'أدخل رقم الهاتف',
          ),
        ] else
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _emailController,
                  label: 'البريد الإلكتروني *',
                  hint: 'example@domain.com',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildTextField(
                  controller: _phoneController,
                  label: 'رقم الهاتف *',
                  hint: 'أدخل رقم الهاتف',
                ),
              ),
            ],
          ),
        const SizedBox(height: 20),
        _buildTextField(
          controller: _subjectController,
          label: 'الموضوع *',
          hint: 'اختر موضوع هنا',
        ),
        const SizedBox(height: 20),
        _buildTextField(
          controller: _messageController,
          label: 'رسالتك *',
          hint: 'أدخل هنا...',
          maxLines: 4,
        ),
        const SizedBox(height: 32),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 4,
            ),
            child: const Text(
              'إرسال الرسالة',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1F44),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0A1F44).withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoSection('العنوان', 'شارع الملك فهد، الرياض\nالمملكة العربية السعودية 12345'),
          const Divider(height: 32, color: Colors.white24),
          _buildInfoSection('التواصل', 'الهاتف: 966-11-123-4567+\nالبريد: info@company.com'),
          const Divider(height: 32, color: Colors.white24),
          _buildInfoSection('أوقات العمل', 'الأحد - الخميس: 10:00 - 20:00\nالسبت: 11:00 - 18:00'),
          const Divider(height: 32, color: Colors.white24),
          const Text(
            'تواصل معنا',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildSocialIcon(Icons.telegram),
              _buildSocialIcon(Icons.facebook),
              _buildSocialIcon(Icons.snapchat),
              _buildSocialIcon(Icons.location_on),
              _buildSocialIcon(Icons.apple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A2E)
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          textAlign: TextAlign.right,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14

            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFFF6B35),
                width: 2,
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

  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white

          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
            height: 1.6

          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B35),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B35).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
