import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/exercise/domain/entites/get_exercise_entity.dart';

abstract class GetExercisesRepo {
  Future<ApiResult<List<ExercisesEntity>>> getExercise(
    String? difficultyLevelId,
    String? primeMoverMuscleId,
  );
}
