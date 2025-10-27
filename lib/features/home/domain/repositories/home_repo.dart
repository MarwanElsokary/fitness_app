import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<List<ExerciseEntity>>> getDailyRecommendationExercise(
    int limit,
    String targetMuscleGroupId,
    String difficultyLevelId,
  );

  Future<ApiResult<List<MealEntity>>> getFoodRecommendation();

  Future<ApiResult<List<MuscleGroupEntity>?>> getAllMuscles();

  Future<ApiResult<List<MuscleEntity>?>> getMusclesByGroup(String id);
}
