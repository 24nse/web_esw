import 'package:flutter/material.dart';

class BlogArticleHeader extends StatelessWidget {
  final String title;
  final String category;
  final String author;
  final DateTime date;
  final int? commentsCount;

  const BlogArticleHeader({
    super.key,
    required this.title,
    required this.category,
    required this.author,
    required this.date,
    this.commentsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          // Article Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A2463),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          
          // Meta Information
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: [
              _MetaItem(
                icon: Icons.folder_outlined,
                text: category,
              ),
              _MetaItem(
                icon: Icons.person_outline,
                text: author,
              ),
              _MetaItem(
                icon: Icons.calendar_today_outlined,
                text: _formatDate(date),
              ),
              if (commentsCount != null)
                _MetaItem(
                  icon: Icons.comment_outlined,
                  text: '$commentsCount تعليقات',
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];
    return '${date.day} ${months[date.month - 1]}، ${date.year}';
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MetaItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: const Color(0xFFFF6B35),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
