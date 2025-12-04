import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';
import 'package:fitness_app/features/workouts/domain/repo/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class WorkoutUseCase {
  WorkoutsRepo workoutsRepo;

  WorkoutUseCase(this.workoutsRepo);

  Future<ApiResult<List<WorkoutEntity>>> call() async {
    final result = await workoutsRepo.getWorkOuts();
    return result;
  }
}
