import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';
import 'package:fitness_app/features/workouts/domain/repo/muscles_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class MusclesUseCase {
  MusclesRepo musclesRepo;

  MusclesUseCase(this.musclesRepo);

  Future<ApiResult<List<MusclesResponseEntity>>> call(
    String? muscleGroupId,
  ) async {
    final result = await musclesRepo.getMuscles(muscleGroupId);
    return result;
  }
}
