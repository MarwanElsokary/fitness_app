import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/exercise/data/data_source/get_all_difficulty_levels_data_source.dart';
import 'package:fitness_app/features/exercise/domain/entites/all_difficulty_level_by_prime_muscle_entity.dart';
import 'package:fitness_app/features/exercise/domain/repo/get_all_difficulty_levels_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllDifficultyLevelsRepo)
class GetAllDifficultyLevelsRepoImpl implements GetAllDifficultyLevelsRepo {
  GetAllDifficultyLevelsDataSource getAllDifficultyLevelsDataSource;

  GetAllDifficultyLevelsRepoImpl(this.getAllDifficultyLevelsDataSource);

  @override
  Future<ApiResult<List<DifficultyLevelsEntity>>> getLevels(
    String? primeMoverMuscleId,
  ) async {
    return await getAllDifficultyLevelsDataSource.getLevels(primeMoverMuscleId);
  }
}
