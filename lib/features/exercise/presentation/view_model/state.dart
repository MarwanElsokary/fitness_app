import 'package:fitness_app/features/exercise/domain/entites/get_exercise_entity.dart';

abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

/// -------- Levels --------
class DifficultyLevelsLoading extends ExerciseState {}

class DifficultyLevelsLoaded extends ExerciseState {
  final List<dynamic>? levels;
  final List<dynamic>? exercises;


  DifficultyLevelsLoaded(this.exercises, {this.levels});
}

class DifficultyLevelsError extends ExerciseState {
  final String? message;


  DifficultyLevelsError({this.message});
}

/// -------- Exercises --------
class ExercisesLoading extends ExerciseState {}

class ExercisesLoaded extends ExerciseState {
  final List<dynamic>? exercises;

  ExercisesLoaded({this.exercises});
}

class ExercisesError extends ExerciseState {
  final String? message;

  ExercisesError({this.message});
}

/// -------- Selected Level --------
class LevelSelectedState extends ExerciseState {
  final String? levelId;
  final String? levelName;

  LevelSelectedState(this.levelId, this.levelName);
}

class ExerciseSelectedState extends ExerciseState {
  final ExercisesEntity exercise;

  ExerciseSelectedState(this.exercise);
}
class ExerciseSelected extends ExerciseState {}