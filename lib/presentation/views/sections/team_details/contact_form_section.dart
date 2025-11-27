import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/widgets/team/team_text_field.dart';

/// Contact form section with validation
class ContactFormSection extends StatefulWidget {
  const ContactFormSection({super.key});

  @override
  State<ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<ContactFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

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

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال الرسالة بنجاح!'),
          backgroundColor: AppColors.success,
        ),
      );

      // Clear form
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _subjectController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
         Text(
          'تواصل معي',
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 32),

        // Form
        Form(
          key: _formKey,
          child: Column(
            children: [
              // First row: First Name and Last Name
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 700;

                  if (isWide) {
                    return Row(
                      children: [
                        Expanded(
                          child: TeamTextField(
                            label: 'الاسم الأول',
                            placeholder: 'مثال: محمد',
                            required: true,
                            controller: _firstNameController,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TeamTextField(
                            label: 'الاسم الأخير',
                            placeholder: 'مثال: أحمد',
                            required: true,
                            controller: _lastNameController,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        TeamTextField(
                          label: 'الاسم الأول',
                          placeholder: 'مثال: محمد',
                          required: true,
                          controller: _firstNameController,
                        ),
                        const SizedBox(height: 16),
                        TeamTextField(
                          label: 'الاسم الأخير',
                          placeholder: 'مثال: أحمد',
                          required: true,
                          controller: _lastNameController,
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 16),

              // Second row: Email and Phone Number
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 700;

                  if (isWide) {
                    return Row(
                      children: [
                        Expanded(
                          child: TeamTextField(
                            label: 'البريد الإلكتروني',
                            placeholder: 'example@gmail.com',
                            required: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              }
                              if (!value.contains('@')) {
                                return 'يرجى إدخال بريد إلكتروني صحيح';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TeamTextField(
                            label: 'رقم الهاتف',
                            placeholder: '+966 50 000 0000',
                            required: true,
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        TeamTextField(
                          label: 'البريد الإلكتروني',
                          placeholder: 'example@gmail.com',
                          required: true,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'هذا الحقل مطلوب';
                            }
                            if (!value.contains('@')) {
                              return 'يرجى إدخال بريد إلكتروني صحيح';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TeamTextField(
                          label: 'رقم الهاتف',
                          placeholder: '+966 50 000 0000',
                          required: true,
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 16),

              // Subject
              TeamTextField(
                label: 'الموضوع',
                placeholder: 'أدخل الموضوع هنا',
                controller: _subjectController,
              ),
              const SizedBox(height: 16),

              // Message
              TeamTextField(
                label: 'رسالتك',
                placeholder: 'أدخل رسالتك هنا',
                maxLines: 5,
                controller: _messageController,
              ),
              const SizedBox(height: 32),

              // Submit button
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child:  Text(
                    'إرسال الرسالة',
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
