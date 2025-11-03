import 'package:fitness_app/features/exercise/presentation/view_model/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/exercise/domain/entites/get_exercise_entity.dart';
import 'package:fitness_app/features/exercise/domain/entites/all_difficulty_level_by_prime_muscle_entity.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_exercises_use_case.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_all_difficulty_levels_use_case.dart';

@injectable
class ExerciseCubit extends Cubit<ExerciseState> {
  String? selectedLevelId;
  String? selectedLevelName;
  ExercisesEntity? selectedExercise;

  final GetExercisesUseCase getExercisesUseCase;
  final GetAllDifficultyLevelsUseCase getAllDifficultyLevelsUseCase;

  ExerciseCubit(this.getExercisesUseCase, this.getAllDifficultyLevelsUseCase)
    : super(ExerciseInitial());

  Future<void> getDifficultyLevels(String? primeMoverMuscleId) async {
    emit(DifficultyLevelsLoading());

    ApiResult<List<DifficultyLevelsEntity>> result =
        await getAllDifficultyLevelsUseCase.call(primeMoverMuscleId);


    switch (result) {
      case ApiSuccessResult<List<DifficultyLevelsEntity>>():
        emit(DifficultyLevelsLoaded(result.data, levels: result.data));

      case ApiErrorResult<List<DifficultyLevelsEntity>>():
        emit(DifficultyLevelsError(message: result.errorMessage));
    }
  }

  Future<void> getExercises(
    String? difficultyLevelId,
    String? primeMoverMuscleId,
  ) async {
    emit(ExercisesLoading());

    ApiResult<List<ExercisesEntity>> result = await getExercisesUseCase.call(
      difficultyLevelId,
      primeMoverMuscleId,
    );

    switch (result) {
      case ApiSuccessResult<List<ExercisesEntity>>():
        emit(ExercisesLoaded(exercises: result.data));

      case ApiErrorResult<List<ExercisesEntity>>():
        emit(ExercisesError(message: result.errorMessage));
    }
  }

  void selectLevel(String? levelId, String? levelName) {
    selectedLevelId = levelId;
    selectedLevelName = levelName;
    selectedExercise = null; // ✅ إعادة التمرين المختار إلى null
    emit(LevelSelectedState(levelId, levelName));
  }

  void selectExercise(ExercisesEntity exercise) {
    selectedExercise = exercise;
    emit(ExerciseSelected());
  }


}
