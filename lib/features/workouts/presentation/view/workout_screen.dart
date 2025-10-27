import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_cubit.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/workout_body_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkoutCubit>()..getWorkOuts(),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/image/workout_bg.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            WorkoutBodyBuilder(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
