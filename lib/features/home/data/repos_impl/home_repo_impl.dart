import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/data/datasources/contract/home_remote_data_source.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);

  @override
  Future<ApiResult<List<ExerciseEntity>>> getDailyRecommendationExercise(
    int limit,
    String targetMuscleGroupId,
    String difficultyLevelId,
  ) async {
    try {
      var response = await _homeRemoteDataSource.getDailyRecommendationExercise(
        limit,
        targetMuscleGroupId,
        difficultyLevelId,
      );
      if (response.message == "success") {
        return ApiSuccessResult(
          response.exercises!.map((exercise) => exercise.toEntity()).toList(),
        );
      } else {
        return ApiErrorResult(response.message ?? 'Unknown error');
      }
    } on DioException catch (e) {
      return ApiErrorResult(e.message ?? "Unknown Dio error");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<ApiResult<List<MealEntity>>> getFoodRecommendation() async {
    try {
      var response = await _homeRemoteDataSource.getFoodRecommendation();

      if (response.meals.isEmpty) {
        return ApiErrorResult('food not found');
      } else {
        return ApiSuccessResult(
          response.meals.map((meal) => meal.toEntity()).toList(),
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(e.message ?? "Unknown Dio error");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  // @override
  // Future<ApiResult<List<CategoryEntity>>> getExerciseCategories()async {

  //     var response = await _homeLocalDataSource.getExerciseCategories();
  //     return response.map((category) => category.toEntity()).toList();

  //   return response;
  // }

  @override
  Future<ApiResult<List<MuscleGroupEntity>?>> getAllMuscles() async {
    try {
      var response = await _homeRemoteDataSource.getAllMuscles();

      if (response.message == "success") {
        return ApiSuccessResult(
          response.musclesGroup?.map((muscle) => muscle.toEntity()).toList(),
        );
      } else {
        return ApiErrorResult(response.message ?? 'Unknown error');
      }
    } on DioException catch (e) {
      return ApiErrorResult(e.message ?? "Unknown Dio error");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<ApiResult<List<MuscleEntity>?>> getMusclesByGroup(String id) async {
    try {
      var response = await _homeRemoteDataSource.getMusclesByGroup(id);
      if (response.message == "success") {
        return ApiSuccessResult(
          response.muscles.map((muscle) => muscle.toEntity()).toList(),
        );
      } else {
        return ApiErrorResult(response.message);
      }
    } on DioException catch (e) {
      return ApiErrorResult(e.message ?? "Unknown Dio error");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
