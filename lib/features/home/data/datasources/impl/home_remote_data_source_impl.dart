import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:injectable/injectable.dart';

import '../../models/daily_recommendation_exercise_dto.dart';
import '../../models/muscles_by_group_response.dart';
import '../../models/muscles_group_dto.dart';
import '../../models/recommendation_meals_dto.dart';
import '../contract/home_remote_data_source.dart';

@Singleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _homeRetrofitClient;

  HomeRemoteDataSourceImpl(this._homeRetrofitClient);

  @override
  Future<DailyRecommendationExerciseDto> getDailyRecommendationExercise(
    int limit,
    String targetMuscleGroupId,
    String difficultyLevelId,
  ) async {
    var response = await _homeRetrofitClient.getDailyRecommendationExercise(
      limit,
      targetMuscleGroupId,
      difficultyLevelId,
    );
    return response;
  }

  @override
  Future<RecommendationMealsDto> getFoodRecommendation() async {
    var response = await _homeRetrofitClient.getFoodRecommendation();
    return response;
  }

  @override
  Future<MusclesGroupDto> getAllMuscles() async {
    var response = await _homeRetrofitClient.getAllMuscles();
    return response;
  }

  @override
  Future<MusclesByGroupResponse> getMusclesByGroup(String id) async {
    var response = await _homeRetrofitClient.getMusclesByGroup(id);
    return response;
  }
}
