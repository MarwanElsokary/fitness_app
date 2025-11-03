import 'package:fitness_app/features/exercise/presentation/widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/state.dart';

import '../widgets/level_header.dart' show LevelHeader;

class ExerciseScreen extends StatelessWidget {
  final String? primeMoverMuscleId;

  const ExerciseScreen({super.key, this.primeMoverMuscleId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ExerciseCubit>()..getDifficultyLevels(primeMoverMuscleId),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/workout_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            BlocBuilder<ExerciseCubit, ExerciseState>(
              buildWhen: (_, state) =>
                  state is DifficultyLevelsLoading ||
                  state is DifficultyLevelsLoaded ||
                  state is DifficultyLevelsError,
              builder: (context, state) {
                if (state is DifficultyLevelsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DifficultyLevelsError) {
                  return Center(child: Text(state.message ?? "Error"));
                } else if (state is DifficultyLevelsLoaded) {
                  final levels = state.levels ?? [];

                  if (levels.isEmpty) {
                    return const Center(child: Text("No levels found"));
                  }

                  return DefaultTabController(
                    length: levels.length,
                    child: Builder(
                      builder: (context) {
                        final cubit = context.read<ExerciseCubit>();

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (cubit.selectedLevelId == null &&
                              levels.isNotEmpty) {
                            final firstLevel = levels.first;
                            cubit.selectLevel(firstLevel.id, firstLevel.name);
                            cubit.getExercises(
                              firstLevel.id,
                              primeMoverMuscleId,
                            );
                          }
                        });

                        final exState = context.watch<ExerciseCubit>().state;
                        String exerciseInfo = '';
                        if (exState is ExercisesLoaded &&
                            exState.exercises != null) {
                            }

                        return NestedScrollView(
                          headerSliverBuilder: (_, __) => [
                            SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  LevelHeader(
                                    levels: levels,
                                    primeMoverId: primeMoverMuscleId,
                                  ),
                                  SizedBox(height: 10.h),
                                  if (exerciseInfo.isNotEmpty)
                                    Text(
                                      exerciseInfo,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                          body: BlocBuilder<ExerciseCubit, ExerciseState>(
                            buildWhen: (_, s) =>
                                s is ExercisesLoading ||
                                s is ExercisesLoaded ||
                                s is ExercisesError,
                            builder: (context, exState) {
                              if (exState is ExercisesLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (exState is ExercisesError) {
                                return Center(
                                  child: Text(exState.message ?? 'Error'),
                                );
                              } else if (exState is ExercisesLoaded) {
                                final exercises = exState.exercises ?? [];
                                if (exercises.isEmpty) {
                                  return const Center(
                                    child: Text('No exercises found'),
                                  );
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.all(16.w),
                                  itemCount: exercises.length,
                                  itemBuilder: (context, index) {
                                    final exercise = exercises[index];
                                    return ExerciseCard(
                                      exercise: exercise,
                                      onTap: () => context
                                          .read<ExerciseCubit>()
                                          .selectExercise(exercise),
                                    );
                                  },
                                );
                              }

                              return const Center(
                                child: Text('Select a difficulty level'),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
