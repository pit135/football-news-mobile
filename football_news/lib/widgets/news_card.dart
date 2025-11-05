import 'package:flutter/material.dart';

class News {
  final String title;
  final String content;
  final String category;
  final String thumbnailUrl;
  final bool isFeatured;

  const News({
    required this.title,
    required this.content,
    required this.category,
    required this.thumbnailUrl,
    required this.isFeatured,
  });
}

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                Chip(
                  label: Text(news.category),
                ),
                const SizedBox(width: 8),
                if (news.isFeatured)
                  const Chip(
                    label: Text('Unggulan'),
                  ),
              ],
            ),
            const SizedBox(height: 6),

            Text(
              news.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            if (news.thumbnailUrl.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                'Thumbnail: ${news.thumbnailUrl}',
                style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
