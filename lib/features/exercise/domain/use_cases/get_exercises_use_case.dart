import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/exercise/domain/entites/get_exercise_entity.dart';
import 'package:fitness_app/features/exercise/domain/repo/get_exercises_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExercisesUseCase {
  GetExercisesRepo getExercisesRepo;

  GetExercisesUseCase(this.getExercisesRepo);

  Future<ApiResult<List<ExercisesEntity>>> call(
    String? difficultyLevelId,
    String? primeMoverMuscleId,
  ) async {
    final result = await getExercisesRepo.getExercise(
      difficultyLevelId,
      primeMoverMuscleId,
    );
    return result;
  }
}
