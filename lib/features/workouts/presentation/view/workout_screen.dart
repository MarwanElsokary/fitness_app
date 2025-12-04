import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_cubit.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/workout_body_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutScreen extends StatelessWidget {
  final WorkoutCubit? cubit;

  const WorkoutScreen({super.key, this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit ?? getIt<WorkoutCubit>()
        ..getWorkOuts(),
      child: Scaffold(
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
            const WorkoutBodyBuilder(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
