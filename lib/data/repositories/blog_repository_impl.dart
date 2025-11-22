import '../../domain/entities/blog_post.dart';
import '../../domain/entities/blog_category.dart';
import '../../domain/repositories/blog_repository.dart';
import '../models/blog_post_model.dart';
import '../models/blog_category_model.dart';

class BlogRepositoryImpl implements BlogRepository {
  @override
  Future<List<BlogPost>> getBlogPosts() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    return _mockBlogPosts;
  }

  @override
  Future<List<BlogCategory>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    
    return _mockCategories;
  }

  @override
  Future<List<BlogPost>> getRecentPosts(int limit) async {
    await Future.delayed(const Duration(milliseconds: 200));
    
    return _mockBlogPosts.take(limit).toList();
  }
}

// Mock Data - Arabic Content
final List<BlogPost> _mockBlogPosts = [
  BlogPostModel(
    id: '1',
    title: 'كيف تُحدث التكنولوجيا ثورة في صناعة البناء والتشييد',
    excerpt: 'اكتشف كيف تُغير التقنيات الحديثة طريقة البناء، من التصميم بالذكاء الاصطناعي إلى البناء الآلي.',
    content: 'محتوى المقال الكامل هنا...',
    category: 'اتجاهات البناء',
    categoryColor: '0xFF0A2463',
    imageUrl: 'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?w=800',
    authorName: 'م. أحمد الخليفي',
    authorAvatar: 'https://i.pravatar.cc/150?img=12',
    publishDate: DateTime(2024, 11, 15),
    readTimeMinutes: 3,
    commentsCount: 5,
    tags: ['تكنولوجيا', 'ابتكار', 'بناء'],
  ),
  BlogPostModel(
    id: '2',
    title: '5 خطوات أساسية لنجاح مشروع البناء',
    excerpt: 'تعرّف على الخطوات الخمس الحاسمة التي تضمن إنجاز مشروعك في الوقت المحدد وضمن الميزانية وبأعلى معايير الجودة.',
    content: 'محتوى المقال الكامل هنا...',
    category: 'إدارة المشاريع',
    categoryColor: '0xFF0A2463',
    imageUrl: 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800',
    authorName: 'د. سارة الزهراني',
    authorAvatar: 'https://i.pravatar.cc/150?img=5',
    publishDate: DateTime(2024, 11, 10),
    readTimeMinutes: 5,
    commentsCount: 8,
    tags: ['إدارة', 'تخطيط', 'أفضل الممارسات'],
  ),
  BlogPostModel(
    id: '3',
    title: 'نصائح السلامة في المواقع: ضمان رحلة بناء آمنة',
    excerpt: 'السلامة أولاً دائماً. إليك النصائح الأساسية للحفاظ على موقع بناء آمن لجميع العمال.',
    content: 'محتوى المقال الكامل هنا...',
    category: 'الصحة والسلامة',
    categoryColor: '0xFF0A2463',
    imageUrl: 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?w=800',
    authorName: 'م. محمد العتيبي',
    authorAvatar: 'https://i.pravatar.cc/150?img=33',
    publishDate: DateTime(2024, 11, 5),
    readTimeMinutes: 4,
    commentsCount: 12,
    tags: ['سلامة', 'أنظمة', 'عمال'],
  ),
  BlogPostModel(
    id: '4',
    title: 'أفضل 10 مهارات يحتاجها المقاولون للمشاريع الحديثة',
    excerpt: 'صناعة البناء في تطور مستمر. ابقَ منافساً مع هذه المهارات الأساسية التي يجب على كل مقاول إتقانها.',
    content: 'محتوى المقال الكامل هنا...',
    category: 'الأعمال والاستراتيجية',
    categoryColor: '0xFF0A2463',
    imageUrl: 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=800',
    authorName: 'أ. فاطمة القحطاني',
    authorAvatar: 'https://i.pravatar.cc/150?img=47',
    publishDate: DateTime(2024, 11, 1),
    readTimeMinutes: 6,
    commentsCount: 15,
    tags: ['مهارات', 'تطوير', 'مهنة'],
  ),
  BlogPostModel(
    id: '5',
    title: '6 نصائح مهمة لتجديد منزلك بنجاح',
    excerpt: 'تخطط لتجديد منزلك؟ ستساعدك هذه النصائح المتخصصة على إتمام العملية بسلاسة وتجنب الأخطاء الشائعة.',
    content: 'محتوى المقال الكامل هنا...',
    category: 'نصائح البناء',
    categoryColor: '0xFF0A2463',
    imageUrl: 'https://images.unsplash.com/photo-1581092160562-40aa08e78837?w=800',
    authorName: 'م. خالد المطيري',
    authorAvatar: 'https://i.pravatar.cc/150?img=68',
    publishDate: DateTime(2024, 10, 28),
    readTimeMinutes: 5,
    commentsCount: 10,
    tags: ['تجديد', 'منازل', 'نصائح'],
  ),
];

final List<BlogCategory> _mockCategories = [
  const BlogCategoryModel(
    id: '1',
    name: 'آخر الأخبار',
    postCount: 12,
    icon: '📰',
  ),
  const BlogCategoryModel(
    id: '2',
    name: 'إدارة المشاريع',
    postCount: 8,
    icon: '📋',
  ),
  const BlogCategoryModel(
    id: '3',
    name: 'نصائح البناء',
    postCount: 15,
    icon: '🏗️',
  ),
  const BlogCategoryModel(
    id: '4',
    name: 'الأعمال والاستراتيجية',
    postCount: 6,
    icon: '💼',
  ),
];
