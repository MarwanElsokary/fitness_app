import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../view_model/cubit/home_cubit.dart';
import 'build_category_list_items.dart';
import 'build_new_list_items.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<HomeCubit>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.image.background3.path),
          fit: BoxFit.cover,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name 👋',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Let Us Start Your Fitness Journey",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 18.0),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25.0,
                  child: SvgPicture.asset(Assets.icons.profile.path),
                ),
              ],
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.getExerciseCategoriesState !=
                current.getExerciseCategoriesState,
            builder: (context, state) {
              return BuildCategoryListItems(
                categories: viewModel.exerciseCategories,
              );
            },
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.getDailyRecommendationExerciseState !=
                current.getDailyRecommendationExerciseState,
            builder: (context, state) {
              return BuildNewListItems(
                category: "Recommendation Today",
                listOfItems: viewModel.dailyRecommendation,
              );
            },
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                (previous.getAllMuscelsState != current.getAllMuscelsState ||
                previous.getMusclesByGroupState !=
                    current.getMusclesByGroupState),
            builder: (context, state) {
              return BuildNewListItems(
                category: "Up coming Workouts",
                listOfItems: viewModel.muscles,
                listOfButtons: true,
                listOfMuscles:
                    viewModel.muscleGroups as List<MuscleGroupEntity>?,
              );
            },
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                previous.getFoodRecommendationState !=
                current.getFoodRecommendationState,
            builder: (context, state) {
              return BuildNewListItems(
                category: "Recommendation For You",
                listOfItems: viewModel.foodRecommendation,
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 75.0)),
        ],
      ),
    );
  }
}
