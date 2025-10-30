import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/exercise/domain/entites/all_difficulty_level_by_prime_muscle_entity.dart';

abstract class GetAllDifficultyLevelsRepo {
  Future<ApiResult<List<DifficultyLevelsEntity>>> getLevels(
    String? primeMoverMuscleId,
  );
}
