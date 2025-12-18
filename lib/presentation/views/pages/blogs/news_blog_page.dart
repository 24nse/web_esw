import 'package:flutter/material.dart';
import 'package:web_site/common/constants/theme/tokens.dart';
import 'package:web_site/presentation/views/pages/blog_details/blog_details_page.dart';
import 'package:web_site/presentation/views/widgets/common/page_hero_section.dart';
import '../../../../../domain/repositories/blog_repository.dart';
import '../../../../../data/repositories/blog_repository_impl.dart';
import '../../../../../domain/entities/blog_post.dart';
import '../../../../../domain/entities/blog_category.dart';
import '../../sections/blog/blog_page_header.dart';
import '../../sections/landing/footer_section.dart';
import '../../widgets/blog/blog_pagination.dart';
import '../../widgets/blog/featured_post_card.dart';
import '../../widgets/blog/post_card.dart';
import '../../widgets/blog/sidebar_categories.dart';
import '../../widgets/blog/sidebar_cta_card.dart';
import '../../widgets/blog/sidebar_recent_posts.dart';
import '../../widgets/blog/sidebar_search.dart';
import '../../widgets/graphics/unified_ruler_ticks_painter.dart';

class NewsBlogPage extends StatefulWidget {
  const NewsBlogPage({super.key});

  @override
  State<NewsBlogPage> createState() => _NewsBlogPageState();
}

class _NewsBlogPageState extends State<NewsBlogPage> {
  final BlogRepository _repository = BlogRepositoryImpl();
  List<BlogPost> _posts = [];
  List<BlogCategory> _categories = [];
  List<BlogPost> _recentPosts = [];
  int _currentPage = 1;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    
    final posts = await _repository.getBlogPosts();
    final categories = await _repository.getCategories();
    final recentPosts = await _repository.getRecentPosts(3);
    
    setState(() {
      _posts = posts;
      _categories = categories;
      _recentPosts = recentPosts;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageHeroSection(
              title: 'المدونة',
              breadcrumbItems: [
                BreadcrumbItem(label: 'الرئيسية'),
                BreadcrumbItem(label: 'المدونة', isActive: true),
              ],
            ),

            // Page Header
            CustomPaint(
                foregroundPainter: UnifiedRulerTicksPainter(
                  drawBottom: false,
                  // أعلى أفقي
                  drawTop: true,
                  topMode: UnifiedRulerTicksMode.horizontal,
                  topStep: 10,
                  topPatternHeights: const [14, 6, 10, 6, 14],
                  topMargin: 0,
                  topStrokeWidth: 1,
                  topColor: const Color(0xFFD1D5DB),
                ),

                child: const BlogPageHeader()),

            // Main Content
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: _isLoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(80.0),
                            child: CircularProgressIndicator(
                              color: Color(0xFFFF6B35),
                            ),
                          ),
                        )
                      : LayoutBuilder(
                          builder: (context, constraints) {
                            // Responsive layout
                            if (constraints.maxWidth > 900) {
                              return _buildDesktopLayout();
                            } else {
                              return _buildMobileLayout();
                            }
                          },
                        ),
                ),
              ),
            ),
            
            const SizedBox(height: 80),
            
            // Footer
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column - Posts
        Expanded(
          flex: 7,
          child: Column(
            children: [
              // Featured Post
              if (_posts.isNotEmpty)
                FeaturedPostCard(
                  post: _posts.first,
                  onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BlogDetailsPage()),
                      );
                                    },
                ),
              
              const SizedBox(height: 32),
              
              // Regular Posts
              ..._posts.skip(1).map((post) => Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: PostCard(
                  post: post,
                  onTap: () {
                    // TODO: Navigate to post detail
                  },
                ),
              )),
              
              // Pagination
              BlogPagination(
                currentPage: _currentPage,
                totalPages: 3,
                onPageChanged: (page) {
                  setState(() => _currentPage = page);
                },
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
        
        const SizedBox(width: 32),
        
        // Right Column - Sidebar
        SizedBox(
          width: 320,
          child: Column(
            children: [
              // Search
              const SidebarSearch(),
              const SizedBox(height: 24),
              
              // Categories
              SidebarCategories(
                categories: _categories,
                onCategoryTap: (category) {
                  // TODO: Filter by category
                },
              ),
              const SizedBox(height: 24),
              
              // Recent Posts
              SidebarRecentPosts(
                recentPosts: _recentPosts,
                onPostTap: (post) {
                  // TODO: Navigate to post detail
                },
              ),
              const SizedBox(height: 24),
              
              // CTA Card
              SidebarCtaCard(
                onContactPressed: () {
                  // TODO: Navigate to contact
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Featured Post
        if (_posts.isNotEmpty)
          FeaturedPostCard(
            post: _posts.first,
            onTap: () {
              // TODO: Navigate to post detail
            },
          ),
        
        const SizedBox(height: 32),
        
        // Regular Posts
        ..._posts.skip(1).map((post) => Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: PostCard(
            post: post,
            onTap: () {
              // TODO: Navigate to post detail
            },
          ),
        )),
        
        // Pagination
        BlogPagination(
          currentPage: _currentPage,
          totalPages: 3,
          onPageChanged: (page) {
            setState(() => _currentPage = page);
          },
        ),
        
        const SizedBox(height: 40),
        
        // Sidebar Components (stacked vertically on mobile)
        const SidebarSearch(),
        const SizedBox(height: 24),
        
        SidebarCategories(
          categories: _categories,
          onCategoryTap: (category) {
            // TODO: Filter by category
          },
        ),
        const SizedBox(height: 24),
        
        SidebarRecentPosts(
          recentPosts: _recentPosts,
          onPostTap: (post) {
            // TODO: Navigate to post detail
          },
        ),
        const SizedBox(height: 24),
        
        SidebarCtaCard(
          onContactPressed: () {
            // TODO: Navigate to contact
          },
        ),
        
        const SizedBox(height: 40),
      ],
    );
  }
}
