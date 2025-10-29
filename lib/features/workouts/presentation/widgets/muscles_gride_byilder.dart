import 'package:fitness_app/core/extensions/project_extensions.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_cubit.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/route/app_routes.dart';

class MusclesGrideByilder extends StatelessWidget {
  const MusclesGrideByilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkOutState>(
      buildWhen: (previous, current) =>
          current is MusclesLoaded ||
          current is MusclesError ||
          current is MusclesLoading,
      builder: (context, state) {
        if (state is MusclesLoading) {
          return const Center(

            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.orange,
            ),
          );
        } else if (state is MusclesError) {
          return Center(child: Text(state.message ?? ''));
        } else if (state is MusclesLoaded) {
          if (state.muscles!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/empty.png', // ضع صورة لطيفة هنا
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.noWorkoutsAvailableYet,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: state.muscles!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final muscle = state.muscles![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.onBoardingScreen,
                    arguments: muscle,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(muscle.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      muscle.name ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
