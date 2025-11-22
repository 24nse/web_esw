import 'package:flutter/material.dart';
import '../../sections/blog/blog_details/blog_page_header_section.dart';
import '../../sections/blog/blog_details/blog_hero_section.dart';
import '../../sections/blog/blog_details/blog_article_header.dart';
import '../../sections/blog/blog_details/related_news_section.dart';
import '../../sections/project_details/footer_section.dart';
import '../../widgets/blog/blog_details/article_section_heading.dart';
import '../../widgets/blog/blog_details/social_share_bar.dart';
import '../../widgets/blog/blog_details/article_paragraph.dart';
import '../../widgets/blog/blog_details/bullet_point_item.dart';
import '../../widgets/blog/blog_details/quote_highlight_bar.dart';
import '../../widgets/blog/blog_details/feature_icon_item.dart';
import '../../widgets/blog/blog_details/image_collage_section.dart';
import '../../widgets/blog/blog_details/article_cta_card.dart';
import '../../widgets/blog/blog_details/author_card.dart';
import '../../widgets/blog/blog_details/sidebar_filter_categories.dart';
import '../../widgets/blog/blog_details/sidebar_table_of_contents.dart';
import '../../widgets/blog/blog_details/sidebar_consultation_cta.dart';
import '../../widgets/common/page_hero_section.dart';

class BlogDetailsPage extends StatelessWidget {
  const BlogDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            PageHeroSection(
              title: 'تفاصيل المقال',
              breadcrumbItems: [
                BreadcrumbItem(label: 'الرئيسية'),
                BreadcrumbItem(label: 'تفاصيل المقال', isActive: true),
              ],
            ),


            // Main Content Area
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  children: [
                    // Hero Image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                      child: const BlogHeroSection(
                        imageUrl: 'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?w=1200',
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Article Header (Title + Meta)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: BlogArticleHeader(
                        title: 'كيف تُحدث التكنولوجيا ثورة في صناعة البناء والتشييد',
                        category: 'اتجاهات البناء',
                        author: 'م. أحمد الخليفي',
                        date: DateTime(2024, 11, 15),
                        commentsCount: 5,
                      ),
                    ),
                    
                    // Article Content + Sidebar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 900) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Main Article Column
                                Expanded(
                                  flex: 7,
                                  child: _buildArticleContent(),
                                ),
                                const SizedBox(width: 32),
                                // Sidebar
                                SizedBox(
                                  width: 320,
                                  child: _buildSidebar(),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                _buildArticleContent(),
                                const SizedBox(height: 40),
                                _buildSidebar(),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    
                    // Related News Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: RelatedNewsSection(
                        relatedPosts: _getRelatedPosts(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Footer
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Social Share Bar
        const SocialShareBar(),
        const SizedBox(width: 24),
        // Article Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction
              const ArticleSectionHeading(
                text: 'دور التكنولوجيا في البناء الحديث',
              ),
              const ArticleParagraph(
                text: 'شهدت صناعة البناء والتشييد تطوراً هائلاً في السنوات الأخيرة بفضل التقنيات الحديثة والابتكارات التكنولوجية. أصبحت التكنولوجيا عنصراً أساسياً في كل مرحلة من مراحل المشروع، من التصميم والتخطيط إلى التنفيذ والتسليم.',
              ),
              const ArticleParagraph(
                text: 'تساهم التقنيات الحديثة مثل نمذجة معلومات البناء (BIM)، والطباعة ثلاثية الأبعاد، والروبوتات، والذكاء الاصطناعي في تحسين الكفاءة وتقليل التكاليف وزيادة الدقة في المشاريع الإنشائية.',
              ),
              
              // Risks Section
              const ArticleSectionHeading(
                text: 'مخاطر التكنولوجيا في البناء الحديث',
                fontSize: 18,
              ),
              const ArticleParagraph(
                text: 'على الرغم من الفوائد الكبيرة، إلا أن استخدام التكنولوجيا في البناء يحمل بعض التحديات والمخاطر التي يجب أخذها بعين الاعتبار.',
              ),
              
              // Automation Section
              const ArticleSectionHeading(
                text: 'الأتمتة في عمليات البناء',
                fontSize: 18,
              ),
              const ArticleParagraph(
                text: 'الأتمتة أحدثت نقلة نوعية في صناعة البناء، حيث تمكّن من تنفيذ المهام المعقدة بدقة وسرعة فائقة. من المعدات الثقيلة المُتحكم بها آلياً إلى الطائرات بدون طيار للمسح والمراقبة.',
              ),
              
              // Image Collage
              const ImageCollageSection(
                mainImageUrl: 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800',
                topRightImageUrl: 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?w=400',
                bottomRightImageUrl: 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=400',
                label: 'تصور تفاعلي للمنتج',
              ),
              
              // CTA Card
              ArticleCtaCard(
                title: 'أفضل شركة مقاولات لمشروعك القادم',
                avatarUrl: 'https://i.pravatar.cc/150?img=12',
                onPressed: () {},
              ),
              
              // Quote Bar
              const QuoteHighlightBar(
                text: 'من المخططات إلى الواقع – تسد التكنولوجيا الفجوة بين الرؤية والتنفيذ',
              ),
              
              // Enhanced Customer Experience
              const ArticleSectionHeading(
                text: 'تحسين تجربة العملاء من خلال التقنيات الرقمية',
              ),
              const ArticleParagraph(
                text: 'التكنولوجيا لا تقتصر فقط على تحسين عمليات البناء، بل تمتد لتشمل تحسين تجربة العملاء بشكل كبير.',
              ),
              
              // Features Row
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 400) {
                    return const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: FeatureIconItem(
                            icon: Icons.chat_bubble_outline,
                            title: 'تواصل أفضل',
                            description: 'منصات رقمية لتواصل مباشر وفوري مع فريق المشروع',
                          ),
                        ),
                        SizedBox(width: 24),
                        Expanded(
                          child: FeatureIconItem(
                            icon: Icons.track_changes,
                            title: 'تتبع فوري',
                            description: 'متابعة تقدم المشروع لحظة بلحظة عبر التطبيقات',
                          ),
                        ),
                        SizedBox(width: 24),
                        Expanded(
                          child: FeatureIconItem(
                            icon: Icons.security,
                            title: 'سلامة محسّنة',
                            description: 'أنظمة ذكية لضمان أعلى معايير السلامة',
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Column(
                      children: [
                        FeatureIconItem(
                          icon: Icons.chat_bubble_outline,
                          title: 'تواصل أفضل',
                          description: 'منصات رقمية لتواصل مباشر وفوري مع فريق المشروع',
                        ),
                        SizedBox(height: 24),
                        FeatureIconItem(
                          icon: Icons.track_changes,
                          title: 'تتبع فوري',
                          description: 'متابعة تقدم المشروع لحظة بلحظة عبر التطبيقات',
                        ),
                        SizedBox(height: 24),
                        FeatureIconItem(
                          icon: Icons.security,
                          title: 'سلامة محسّنة',
                          description: 'أنظمة ذكية لضمان أعلى معايير السلامة',
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 32,),
              // Future Shape Section
              const ArticleSectionHeading(
                text: 'كيف ستشكّل التكنولوجيا مستقبل التجارب',
              ),
              const ArticleParagraph(
                text: 'مستقبل صناعة البناء سيشهد المزيد من التطور والابتكار. نتوقع أن تلعب تقنيات مثل الواقع الافتراضي والمعزز، والطباعة ثلاثية الأبعاد للمباني الكاملة، والمواد الذكية دوراً محورياً في تغيير شكل الصناعة.',
              ),
              
              // Bullet Points
              const SizedBox(height: 16),
              const BulletPointItem(
                text: 'شفافية محسّنة في المشاريع والعمليات',
              ),
              const BulletPointItem(
                text: 'اتخاذ قرارات أسرع بناءً على البيانات الحقيقية',
              ),
              const BulletPointItem(
                text: 'تجارب أكثر تخصيصاً للعملاء',
              ),
              const BulletPointItem(
                text: 'استدامة بيئية أفضل من خلال التقنيات الخضراء',
              ),
              
              // Author Card
              const AuthorCard(
                name: 'م. أحمد الخليفي',
                role: 'مدير المشاريع',
                avatarUrl: 'https://i.pravatar.cc/150?img=12',
                bio: 'مهندس مدني متخصص في المشاريع الكبرى مع خبرة تزيد عن 15 عاماً في مجال البناء والتشييد.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSidebar() {
    return Column(
      children: [
        // Filter Categories
        SidebarFilterCategories(
          categories: const [
            'البناء',
            'التكنولوجيا',
            'استراتيجية الأعمال',
            'إدارة المشاريع',
          ],
          onCategoryTap: (category) {
            // TODO: Filter by category
          },
        ),
        const SizedBox(height: 24),
        
        // Table of Contents
        SidebarTableOfContents(
          sections: const [
            'دور التكنولوجيا في البناء الحديث',
            'الأتمتة في عمليات البناء',
            'تصور تفاعلي للمنتج',
            'تحسين تجربة العملاء من خلال التقنيات الرقمية',
            'كيف ستشكّل التكنولوجيا مستقبل التجارب',
          ],
          onSectionTap: (index) {
            // TODO: Scroll to section
          },
        ),
        const SizedBox(height: 24),
        
        // Consultation CTA
        SidebarConsultationCta(
          onPressed: () {
            // TODO: Navigate to contact
          },
        ),
      ],
    );
  }

  List<RelatedPost> _getRelatedPosts() {
    return const [
      RelatedPost(
        title: '5 خطوات أساسية لنجاح مشروع البناء',
        imageUrl: 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=600',
        category: 'إدارة المشاريع',
        date: '10 نوفمبر، 2024',
        author: 'د. سارة الزهراني',
      ),
      RelatedPost(
        title: 'نصائح السلامة في المواقع: ضمان رحلة بناء آمنة',
        imageUrl: 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?w=600',
        category: 'الصحة والسلامة',
        date: '5 نوفمبر، 2024',
        author: 'م. محمد العتيبي',
      ),
      RelatedPost(
        title: 'أفضل 10 مهارات يحتاجها المقاولون للمشاريع الحديثة',
        imageUrl: 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=600',
        category: 'الأعمال والاستراتيجية',
        date: '1 نوفمبر، 2024',
        author: 'أ. فاطمة القحطاني',
      ),
    ];
  }
}
