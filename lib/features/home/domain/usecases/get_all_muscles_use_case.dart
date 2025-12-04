import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllMusclesUseCase {
  final HomeRepo _homeRepo;

  GetAllMusclesUseCase(this._homeRepo);

  Future<ApiResult<List<MuscleGroupEntity>?>> call() async =>
      await _homeRepo.getAllMuscles();
}
