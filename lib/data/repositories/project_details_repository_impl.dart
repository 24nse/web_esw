import '../../domain/entities/project_details.dart';
import '../../domain/repositories/project_details_repository.dart';

class ProjectDetailsRepositoryImpl implements ProjectDetailsRepository {
  @override
  Future<ProjectDetails> getProjectDetails(String projectId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return const ProjectDetails(
      id: '1',
      title: 'مركز الأعمال التجاري',
      category: 'إنشاءات تجارية',
      location: 'الرياض، المملكة العربية السعودية',
      totalArea: '18,000 متر مربع',
      year: '2023',
      heroImageUrl: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=1200',
      description: '''مشروع عصري متكامل يجمع بين التصميم المعماري الحديث والوظائف المتطورة. يقع المشروع في قلب العاصمة الرياض، ويمثل نموذجاً للتطور العمراني المستدام.

تم تصميم المشروع بأعلى معايير الجودة والكفاءة، مع التركيز على توفير بيئة عمل مريحة وحديثة. يتميز المبنى بواجهات زجاجية عصرية وأنظمة ذكية للطاقة والأمن.

يعد هذا المشروع إضافة نوعية للمشهد العمراني في المنطقة، ويعكس رؤيتنا في تقديم حلول عقارية متميزة تلبي احتياجات السوق المحلي والإقليمي.''',
      
      challengeTitle: 'التحدي',
      challengeDescription: '''كان التحدي الأساسي يتمثل في بناء مجمع تجاري حديث في منطقة حيوية بالعاصمة مع الالتزام الصارم باللوائح التنظيمية ومعايير البناء السعودية. تطلب المشروع حلولاً مبتكرة لتعظيم استغلال المساحة مع الحفاظ على الجمالية والوظائف. بالإضافة إلى ذلك، كان يجب إنجاز الإنشاءات ضمن جدول زمني محدد دون التأثير على البنية التحتية المحيطة والحركة المرورية.''',
      
      solutionTitle: 'الحل',
      solutionDescription: '''طور فريقنا نهجاً شاملاً يجمع بين التقنيات المتطورة وممارسات البناء المستدامة. قمنا بتطبيق أنظمة إدارة مشاريع متقدمة وتعاونا بشكل وثيق مع الجهات المختصة لضمان الامتثال لجميع اللوائح.''',
      solutionPoints: [
        SolutionPoint(
          icon: 'check',
          title: 'تصميم مبتكر',
          description: 'تطبيق حلول معمارية حديثة تعظم كفاءة استغلال المساحات.',
        ),
        SolutionPoint(
          icon: 'settings',
          title: 'تقنيات متقدمة',
          description: 'استخدام أحدث تقنيات ومواد البناء المتطورة.',
        ),
        SolutionPoint(
          icon: 'eco',
          title: 'نهج مستدام',
          description: 'دمج ممارسات صديقة للبيئة طوال عملية الإنشاء.',
        ),
      ],
      
      galleryImages: [
        'https://images.unsplash.com/photo-1497366216548-37526070297c?w=800',
        'https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=800',
      ],
      
      scopeTitle: 'نطاق العمل',
      scopeDescription: '''شمل نطاق عملنا الشامل جميع جوانب المشروع من التخطيط الأولي إلى التنفيذ النهائي.''',
      scopeItems: [
        ScopeItem(
          icon: 'design_services',
          title: 'التصميم والتخطيط',
          description: 'تصميم معماري وإنشائي شامل مع تخطيط تفصيلي.',
        ),
        ScopeItem(
          icon: 'handyman',
          title: 'الإنشاءات',
          description: 'خدمات إنشائية متكاملة باستخدام مواد وتقنيات عالية الجودة.',
        ),
        ScopeItem(
          icon: 'verified',
          title: 'ضمان الجودة',
          description: 'رقابة صارمة على الجودة والامتثال لمعايير الصناعة.',
        ),
        ScopeItem(
          icon: 'engineering',
          title: 'إدارة المشروع',
          description: 'تنسيق شامل للمشروع وإدارة الجداول الزمنية.',
        ),
      ],
      
      resultTitle: 'النتيجة',
      resultDescription: '''يقف مركز الأعمال التجاري شاهداً على التميز المعماري الحديث وممارسات البناء المستدامة. تم إنجاز المشروع في الموعد المحدد وتجاوز توقعات العملاء من حيث الجودة والوظائف. يخدم المبنى الآن كوجهة أعمال رائدة، حيث يستضيف العديد من كبرى الشركات ويوفر مرافق عالمية المستوى للمستأجرين. النجاح في إنجاز هذا المشروع وضع معايير جديدة للإنشاءات التجارية في المنطقة.''',
      
      testimonial: Testimonial(
        rating: 5.0,
        title: 'خدمة متميزة!',
        review: '''كان العمل مع هذا الفريق متعة حقيقية. احترافيتهم واهتمامهم بالتفاصيل والتزامهم بالتميز كانت واضحة طوال المشروع. قدموا ما يفوق توقعاتنا وأنشأوا مبنى رائعاً حقاً أصبح معلماً بارزاً في مدينتنا.''',
        reviewerName: 'محمد العتيبي',
        reviewerRole: 'الرئيس التنفيذي، شركة العتيبي القابضة',
        reviewerAvatarUrl: 'https://i.pravatar.cc/150?img=12',
      ),
      
      relatedProjects: [
        RelatedProject(
          id: '2',
          title: 'برج الارتقاء السكني',
          imageUrl: 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=600',
          tags: ['إنجاز 2022', 'سكني'],
        ),
        RelatedProject(
          id: '3',
          title: 'برج العاصمة الإداري',
          imageUrl: 'https://images.unsplash.com/photo-1577495508048-b635879837f1?w=600',
          tags: ['إنجاز 2023', 'مكاتب إدارية'],
        ),
      ],
    );
  }
}
