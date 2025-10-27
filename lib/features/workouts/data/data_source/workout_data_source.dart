import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';

abstract class WorkoutDataSource {
  Future<ApiResult<List<WorkoutEntity>>> getWorkOuts();
}
