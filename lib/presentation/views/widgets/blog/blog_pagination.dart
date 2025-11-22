import 'package:flutter/material.dart';

class BlogPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int>? onPageChanged;

  const BlogPagination({
    super.key,
    required this.currentPage,
    this.totalPages = 5,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Page Numbers
        ...List.generate(totalPages, (index) {
          final pageNum = index + 1;
          final isActive = pageNum == currentPage;
          
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onPageChanged?.call(pageNum),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFFFF6B35) : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isActive ? const Color(0xFFFF6B35) : Colors.grey[300]!,
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$pageNum',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive ? Colors.white : const Color(0xFF0A2463),
                  ),
                ),
              ),
            ),
          );
        }),
        
        // Next Arrow
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: currentPage < totalPages 
                ? () => onPageChanged?.call(currentPage + 1)
                : null,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: currentPage < totalPages 
                    ? const Color(0xFF0A2463)
                    : Colors.grey[400],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
