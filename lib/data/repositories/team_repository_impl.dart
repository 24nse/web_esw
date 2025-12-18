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


  @override
  Future<List<TeamMember>> getAllTeamMembers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const TeamMember(
        id: '1',
        name: 'نوح سعيد',
        title: 'الرئيس التنفيذي',
        description: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
        imageUrl: 'assets/images/eng1.png',
        contactInfo: ContactInfo(phone: '+966 50 000 0000', email: 'nooh@example.com'),
        socialMedia: SocialMedia(facebook: '', twitter: '', linkedin: '', instagram: ''),
        skills: [],
      ),
      const TeamMember(
        id: '2',
        name: ' عمر أحمد',
        title: 'مديرة التسويق',
        description: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
        imageUrl: 'assets/images/eng1.png',
        contactInfo: ContactInfo(phone: '+966 50 000 0000', email: 'sara@example.com'),
        socialMedia: SocialMedia(facebook: '', twitter: '', linkedin: '', instagram: ''),
        skills: [],
      ),
      const TeamMember(
        id: '3',
        name: 'محمد علي',
        title: 'مهندس برمجيات',
        description: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
        imageUrl: 'assets/images/eng1.png',
        contactInfo: ContactInfo(phone: '+966 50 000 0000', email: 'mohammed@example.com'),
        socialMedia: SocialMedia(facebook: '', twitter: '', linkedin: '', instagram: ''),
        skills: [],
      ),
      const TeamMember(
        id: '4',
        name: ' حسن',
        title: 'مصممة جرافيك',
        description: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
        imageUrl: 'assets/images/eng1.png',
        contactInfo: ContactInfo(phone: '+966 50 000 0000', email: 'laila@example.com'),
        socialMedia: SocialMedia(facebook: '', twitter: '', linkedin: '', instagram: ''),
        skills: [],
      ),
      const TeamMember(
        id: '5',
        name: 'خالد عمر',
        title: 'مدير مشاريع',
        description: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
        imageUrl: 'assets/images/eng1.png',
        contactInfo: ContactInfo(phone: '+966 50 000 0000', email: 'khaled@example.com'),
        socialMedia: SocialMedia(facebook: '', twitter: '', linkedin: '', instagram: ''),
        skills: [],
      ),
      const TeamMember(
        id: '6',
        name: 'عبدالله سعيد',
        title: 'محاسبة',
        description: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى.',
        imageUrl: 'assets/images/eng1.png',
        contactInfo: ContactInfo(phone: '+966 50 000 0000', email: 'noura@example.com'),
        socialMedia: SocialMedia(facebook: '', twitter: '', linkedin: '', instagram: ''),
        skills: [],
      ),
    ];
  }
}
