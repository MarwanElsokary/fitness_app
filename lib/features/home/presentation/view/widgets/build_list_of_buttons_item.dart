import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:flutter/material.dart';

class BuildListOfButtonsItem extends StatelessWidget {
  const BuildListOfButtonsItem({super.key, required this.listOfMuscles});

  final List<MuscleGroupEntity>? listOfMuscles;

  @override
  Widget build(BuildContext context) {
    final isLoading = listOfMuscles == null;
    final itemCount = isLoading ? 5 : listOfMuscles!.length;

    return SizedBox(
      height: 35.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final muscleName = isLoading ? "Loading" : listOfMuscles![index].name;
          return ElevatedButton(
            onPressed: () {
              //TODO
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: index == 0
                  ? Colors.deepOrange
                  : Colors.grey.withAlpha(25),
              padding: const EdgeInsets.all(8.0),
              textStyle: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
            ),
            child: Text(
              muscleName ?? '',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
        itemCount: itemCount,
      ),
    );
  }
}
