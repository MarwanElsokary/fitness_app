import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/exercise/domain/entites/all_difficulty_level_by_prime_muscle_entity.dart';
import 'package:fitness_app/features/exercise/domain/repo/get_all_difficulty_levels_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllDifficultyLevelsUseCase {
  GetAllDifficultyLevelsRepo getAllDifficultyLevelsRepo;

  GetAllDifficultyLevelsUseCase(this.getAllDifficultyLevelsRepo);

  Future<ApiResult<List<DifficultyLevelsEntity>>> call(
    String? primeMoverMuscleId,
  ) async {
    final result = await getAllDifficultyLevelsRepo.getLevels(
      primeMoverMuscleId,
    );
    return result;
  }
}
