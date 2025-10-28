import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_styles.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_cubit.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_state.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/muscles_gride_byilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutBodyBuilder extends StatelessWidget {
  const WorkoutBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkOutState>(
      buildWhen: (previous, current) =>
          current is WorkOutLoaded ||
          current is WorkOutError ||
          current is WorkOutLoading,
      builder: (context, state) {
        if (state is WorkOutLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.orange,
            ),
          );
        } else if (state is WorkOutError) {
          return Center(child: Text(state.message ?? ''));
        } else if (state is WorkOutLoaded) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Workouts", style: AppStyles.bold24white)),
                  DefaultTabController(
                    length: state.workouts?.length ?? 0,
                    // state.categoryList?.length ?? 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        labelColor: Colors.white,
                        unselectedLabelColor: AppColors.grey,
                        onTap: (index) {
                          final selectedCategory = state.workouts?[index].id;
                          context.read<WorkoutCubit>().getMuscles(
                            selectedCategory,
                          );
                        },
                        tabs: state.workouts!.map((category) {
                          return Tab(
                            child: Container(

                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(25),

                              ),
                              child: Text(
                                category.name ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  MusclesGrideByilder(),
                ],
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
