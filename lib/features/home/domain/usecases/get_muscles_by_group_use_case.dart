import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMusclesByGroupUseCase {
  final HomeRepo _homeRepo;

  GetMusclesByGroupUseCase(this._homeRepo);

  Future<ApiResult<List<MuscleEntity>?>> call(String id) async =>
      await _homeRepo.getMusclesByGroup(id);
}
