import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:flutter/material.dart';
import 'build_list_of_buttons_item.dart';
import 'build_new_item.dart';

class BuildNewListItems<T> extends StatelessWidget {
  const BuildNewListItems({
    super.key,
    required this.category,
    required this.listOfItems,
    this.listOfMuscles,
    this.listOfButtons = false,
  });

  final String category;
  final List<T>? listOfItems;
  final List<MuscleGroupEntity>? listOfMuscles;
  final bool? listOfButtons;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10.0),
            listOfButtons!
                ? BuildListOfButtonsItem(listOfMuscles: listOfMuscles)
                : const SizedBox.shrink(),
            const SizedBox(height: 10.0),
            SizedBox(
              height: listOfButtons! ? 80.0 : 105.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BuildNewItem<T>(
                    item: listOfItems == null || listOfItems!.isEmpty
                        ? null
                        : listOfItems![index],
                    height: listOfButtons! ? 80.0 : 105.0,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10.0);
                },
                itemCount: listOfItems?.isEmpty ?? true
                    ? 8
                    : listOfItems!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
