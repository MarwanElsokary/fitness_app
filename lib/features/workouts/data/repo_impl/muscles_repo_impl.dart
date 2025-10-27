import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/data/data_source/muscles_data_source.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';
import 'package:fitness_app/features/workouts/domain/repo/muscles_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MusclesRepo)
class MusclesRepoImpl implements MusclesRepo {
  MusclesDataSource musclesDataSource;

  MusclesRepoImpl(this.musclesDataSource);

  @override
  Future<ApiResult<List<MusclesResponseEntity>>> getMuscles(
    String? muscleGroupId,
  ) async {
    return await musclesDataSource.getMuscles(muscleGroupId);
  }
}
