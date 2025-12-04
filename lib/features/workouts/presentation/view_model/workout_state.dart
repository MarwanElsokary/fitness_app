import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';

sealed class WorkOutState {}

final class WorkOutInitial extends WorkOutState {}

final class WorkOutLoading extends WorkOutState {}

final class WorkOutLoaded extends WorkOutState {
  final List<WorkoutEntity>? workouts;

  WorkOutLoaded({this.workouts});
}

final class WorkOutError extends WorkOutState {
  final String? message;

  WorkOutError({this.message});
}

class MusclesLoading extends WorkOutState {}

final class MusclesLoaded extends WorkOutState {
  final List<MusclesResponseEntity>? muscles;

  MusclesLoaded({this.muscles});
}

final class MusclesError extends WorkOutState {
  final String? message;

  MusclesError({this.message});
}
