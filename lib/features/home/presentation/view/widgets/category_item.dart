import 'package:flutter/material.dart';

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
          Image.asset(
            imageUrl ?? '',
            height: 50.0,
            width: 60.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10.0),
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(),
          ),
        ],
      ),
    );
  }
}
