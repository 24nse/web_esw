import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/domain/entities/team_member.dart';
import 'package:web_site/presentation/views/widgets/team/contact_info_row.dart';
import 'package:web_site/presentation/views/widgets/team/social_icons_bar.dart';

import '../../widgets/graphics/clippers.dart';
import '../../widgets/graphics/unified_ruler_ticks_painter.dart';

/// Main profile card section displaying team member information
class ProfileCardSection extends StatelessWidget {
  final TeamMember member;

  const ProfileCardSection({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 700;

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: TopCornerClipper(
                    clipSize: 70,
                    topRadius: 8,
                    sideRadius: 8,
                    isRight: true
                ),
                child: CustomPaint(
                  foregroundPainter: UnifiedRulerTicksPainter(
                    isVertical: true,
                    // الجزء العلوي: مائل
                    drawTop: true,
                    topMode: UnifiedRulerTicksMode.diagonal,
                    topStep: 12,
                    topPatternHeights: const [12], // كل العلامات نفس الطول (مستمر)
                    topMargin: 0,
                    topStrokeWidth: 0.5,
                    topColor: Color(0xFF5F83C8),
                    topAngleDeg:60,
                    topDirection: DiagonalDirection.downRight,

// الجزء السفلي: أفقي
                    drawBottom: true,
                    bottomMode: UnifiedRulerTicksMode.horizontal,
                    bottomStep: 10,
                    bottomPatternHeights: const [14, 6, 10, 6, 14],
                    bottomMargin: 0,
                    bottomStrokeWidth: 0.5,
                    bottomColor: Color(0xFFD1D5DB),

                  ),

                  child: Container(
                      width: 280,
                      height: 320,

                      child: Stack(

                        children: [
                          Positioned.fill(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.bgG,
                      borderRadius: BorderRadius.only(bottomRight:  Radius.circular(16))
                  ),

                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF01165a),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft:  Radius.circular(16))
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: -100,
                              left: 17,
                              child:
                              SizedBox(
                                width: 220,
                                height: 320,

                                child: Image.asset("assets/images/eng1.png"),
                              )
                          )
                        ],
                      )
                  ),
                ),
              ),

              // Left: Image section
              // _buildImageSection(),
              const SizedBox(width: 32),

              // Right: Member info
              Expanded(
                child: _buildMemberInfo(context),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              _buildImageSection(),
              const SizedBox(height: 24),
              _buildMemberInfo(context),
            ],
          );
        }
      },
    );
  }

  Widget _buildImageSection() {
    return Container(
      width: 280,
      height: 320,
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          member.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMemberInfo(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return CustomPaint(
      foregroundPainter: UnifiedRulerTicksPainter(
        isVertical: false,
        // الجزء العلوي: مائل
        drawTop: true,
        topMode: UnifiedRulerTicksMode.horizontal,
        topStep: 10,
        topPatternHeights: const [14, 6, 10, 6, 14],
        topMargin: 0,
        topStrokeWidth: 0.5,
        topColor: Color(0xFFD1D5DB),

// الجزء السفلي: أفقي
        drawBottom: true,
        bottomMode: UnifiedRulerTicksMode.horizontal,
        bottomStep: 10,
        bottomPatternHeights: const [14, 6, 10, 6, 14],
        bottomMargin: 0,
        bottomStrokeWidth: 0.5,
        bottomColor: Color(0xFFD1D5DB),

      ),

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.bgG
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Text(
              member.name,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 8),

            // Title
            Text(
              member.title,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              member.description,
              style: textTheme.bodyMedium?.copyWith(
                height: 1.6,
                color: AppColors.gray,
              ),
            ),
            const SizedBox(height: 24),

            // Contact information
            Row(
              children: [
                ContactInfoRow(
                  icon: Icons.phone,
                  text: member.contactInfo.phone,
                ),
                const SizedBox(width: 12),
                ContactInfoRow(
                  icon: Icons.email,
                  text: member.contactInfo.email,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Social media icons
            SocialIconsBar(
              facebookUrl: member.socialMedia.facebook,
              twitterUrl: member.socialMedia.twitter,
              linkedinUrl: member.socialMedia.linkedin,
              instagramUrl: member.socialMedia.instagram,
            ),
          ],
        ),
      ),
    );
  }
}
