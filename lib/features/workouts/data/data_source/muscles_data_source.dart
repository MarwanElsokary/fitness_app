import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';

abstract class MusclesDataSource {
  Future<ApiResult<List<MusclesResponseEntity>>> getMuscles(
    String? muscleGroupId,
  );
}
