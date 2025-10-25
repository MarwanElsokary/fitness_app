import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDailyRecommendationExerciseUseCase {
  final HomeRepo _homeRepo;

  GetDailyRecommendationExerciseUseCase(this._homeRepo);

  Future<ApiResult<List<ExerciseEntity>>> call(
    int limit,
    String targetMuscleGroupId,
    String difficultyLevelId,
  ) async => _homeRepo.getDailyRecommendationExercise(
    limit,
    targetMuscleGroupId,
    difficultyLevelId,
  );
}
