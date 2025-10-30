import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/exercise/data/data_source/get_exercises_data_source.dart';
import 'package:fitness_app/features/exercise/domain/entites/get_exercise_entity.dart';
import 'package:fitness_app/features/exercise/domain/repo/get_exercises_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetExercisesRepo)
class GetExercisesRepoImpl implements GetExercisesRepo {
  GetExercisesDataSource getExercisesDataSource;

  GetExercisesRepoImpl(this.getExercisesDataSource);

  @override
  Future<ApiResult<List<ExercisesEntity>>> getExercise(
    String? difficultyLevelId,
    String? primeMoverMuscleId,
  ) async {
    return await getExercisesDataSource.getExercise(
      difficultyLevelId,
      primeMoverMuscleId,
    );
  }
}
