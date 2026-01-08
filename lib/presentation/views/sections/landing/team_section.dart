import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/domain/entities/service_card_entity.dart';
import 'package:web_site/presentation/views/pages/team_details/team_details_page.dart';
import 'package:web_site/presentation/views/pages/teams/teams_page.dart';
import 'package:web_site/presentation/views/widgets/common/base_section.dart';
import 'package:web_site/presentation/views/widgets/common/universal_service_card.dart';

/// Team Section using UniversalServiceCard
class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteSection(
      sectionTitle: 'تعرف على فريقنا',
      titleDescription1: 'نخبة من\n',
      titleDescription2: 'الخبراء والمبدعين',
      children: [
        const ServiceSlider(),
        const SizedBox(height: 20),
        Center(
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TeamsPage()),
              );
            },
            icon: const Icon(Icons.arrow_back, size: 18),
            label: const Text(
              'عرض جميع أعضاء الفريق',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}

/// Service Slider using UniversalServiceCard
class ServiceSlider extends StatefulWidget {
  const ServiceSlider({super.key});

  @override
  State<ServiceSlider> createState() => _ServiceSliderState();
}

class _ServiceSliderState extends State<ServiceSlider> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 360,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 360,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Team members data
    final List<ServiceCardEntity> teamMembers = [
      ServiceCardEntity.teamMember(
        image: 'assets/images/eng1.png',
        icon: Icons.villa,
        title: 'علي سعيد',
        description: 'مهندس مدني',
        socialLinks: const [
          SocialLink(icon: Icons.facebook, url: 'https://facebook.com'),
          SocialLink(icon: Icons.email, url: 'mailto:ali@example.com'),
          SocialLink(icon: Icons.link, url: 'https://linkedin.com'),
        ],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TeamDetailsPage(memberId: "1"),
            ),
          );
        },
      ),
      ServiceCardEntity.teamMember(
        image: 'assets/images/eng1.png',
        icon: Icons.business_center,
        title: 'عبدالله عمر',
        description: 'مهندس مشاريع',
        socialLinks: const [
          SocialLink(icon: Icons.facebook, url: 'https://facebook.com'),
          SocialLink(icon: Icons.email, url: 'mailto:abdullah@example.com'),
          SocialLink(icon: Icons.link, url: 'https://linkedin.com'),
        ],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TeamDetailsPage(memberId: "2"),
            ),
          );
        },
      ),
      ServiceCardEntity.teamMember(
        image: 'assets/images/eng1.png',
        icon: Icons.construction,
        title: 'فؤاد عمر',
        description: 'مهندس معماري',
        socialLinks: const [
          SocialLink(icon: Icons.facebook, url: 'https://facebook.com'),
          SocialLink(icon: Icons.email, url: 'mailto:fouad@example.com'),
          SocialLink(icon: Icons.link, url: 'https://linkedin.com'),
        ],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TeamDetailsPage(memberId: "3"),
            ),
          );
        },
      ),
    ];

    return Column(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              for (int i = 0; i < teamMembers.length; i++) ...[
                UniversalServiceCard(entity: teamMembers[i]),
                if (i < teamMembers.length - 1) const SizedBox(width: 20),
              ],
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
