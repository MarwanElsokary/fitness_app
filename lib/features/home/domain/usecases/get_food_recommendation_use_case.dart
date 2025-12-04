import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFoodRecommendationUseCase {
  final HomeRepo _homeRepo;

  GetFoodRecommendationUseCase(this._homeRepo);

  Future<ApiResult<List<MealEntity>>> call() async =>
      await _homeRepo.getFoodRecommendation();
}
