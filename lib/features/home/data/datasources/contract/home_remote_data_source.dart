import '../../models/daily_recommendation_exercise_dto.dart';
import '../../models/muscles_by_group_response.dart';
import '../../models/muscles_group_dto.dart';
import '../../models/recommendation_meals_dto.dart';

abstract class HomeRemoteDataSource {
  Future<DailyRecommendationExerciseDto> getDailyRecommendationExercise(
    int limit,
    String targetMuscleGroupId,
    String difficultyLevelId,
  );

  Future<RecommendationMealsDto> getFoodRecommendation();

  Future<MusclesGroupDto> getAllMuscles();

  Future<MusclesByGroupResponse> getMusclesByGroup(String id);
}
