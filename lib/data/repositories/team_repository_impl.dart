import '../../domain/entities/team_member.dart';
import '../../domain/repositories/team_repository.dart';

class TeamRepositoryImpl implements TeamRepository {
  @override
  Future<TeamMember> getTeamMemberById(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock data based on the design
    return const TeamMember(
      id: '1',
      name: 'نوح سعيد',
      title: 'الرئيس التنفيذي',
      description:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التي يولدها التطبيق.',
      imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
      contactInfo: ContactInfo(
        phone: '+966 000-0000',
        email: 'noohsaeed@gmail.com',
      ),
      socialMedia: SocialMedia(
        facebook: 'https://facebook.com',
        twitter: 'https://twitter.com',
        linkedin: 'https://linkedin.com',
        instagram: 'https://instagram.com',
      ),
      skills: [
        ProfessionalSkill(name: 'التسويق ونمو الأعمال', percentage: 98),
        ProfessionalSkill(name: 'القيادة والإدارة', percentage: 90),
        ProfessionalSkill(name: 'الإبداع والابتكار', percentage: 80),
        ProfessionalSkill(name: 'إدارة الوقت', percentage: 80),
        ProfessionalSkill(name: 'الإدارة المالية والتجارية', percentage: 96),
        ProfessionalSkill(name: 'العلاقات مع العملاء وأصحاب المصلحة', percentage: 85),
      ],
    );
  }
}
