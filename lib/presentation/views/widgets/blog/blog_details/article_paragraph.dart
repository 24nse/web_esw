import 'package:flutter/material.dart';

class ArticleParagraph extends StatelessWidget {
  final String text;

  const ArticleParagraph({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey[700],
          height: 1.8,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
