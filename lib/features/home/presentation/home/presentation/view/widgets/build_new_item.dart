import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BuildNewItem<T> extends StatelessWidget {
  const BuildNewItem({super.key, required this.item, this.height = 105.0});

  final T? item;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade800,
        highlightColor: AppColors.white,
        duration: const Duration(seconds: 1),
      ),
      enabled: item == null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.grey.shade800,
              child: CachedNetworkImage(
                imageUrl: _getImageUrl() ?? '',
                fit: BoxFit.cover,
                width: height,
                height: height,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: Colors.grey.shade800),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: AppColors.red, size: 45),
              ),
            ),
            Container(
              width: height,
              color: Colors.grey.shade800,
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8.0,
              ),
              child: Text(
                _getName() ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _getImageUrl() {
    if (item == null) return '';
    if (item is MuscleEntity) {
      return (item as MuscleEntity).image;
    } else if (item is MealEntity) {
      return (item as MealEntity).imageUrl;
    } else if (item is ExerciseEntity) {
      return (item as ExerciseEntity).imageUrl;
    }
    return '';
  }

  String? _getName() {
    if (item == null) return '';
    if (item is MuscleEntity) {
      return (item as MuscleEntity).name;
    } else if (item is MealEntity) {
      return (item as MealEntity).name;
    } else if (item is ExerciseEntity) {
      return (item as ExerciseEntity).name;
    }

    return '';
  }
}
