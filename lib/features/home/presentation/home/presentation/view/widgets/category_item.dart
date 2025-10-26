import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.imageUrl});

  final String? title;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          SvgPicture.asset(imageUrl ?? '', height: 45.0, width: 45.0),
          const SizedBox(height: 10.0),
          Text(title ?? '', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
