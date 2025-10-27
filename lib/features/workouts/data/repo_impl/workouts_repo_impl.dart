import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/data/data_source/workout_data_source.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';
import 'package:fitness_app/features/workouts/domain/repo/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkoutsRepo)
class WorkoutsRepoImpl implements WorkoutsRepo {
  WorkoutDataSource workoutDataSource;

  WorkoutsRepoImpl(this.workoutDataSource);

  @override
  Future<ApiResult<List<WorkoutEntity>>> getWorkOuts() async {
    return await workoutDataSource.getWorkOuts();
  }
}
