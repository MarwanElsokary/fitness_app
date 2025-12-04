import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/api_layer/models/responses/get_exercise_response.dart';
import 'package:fitness_app/features/exercise/data/data_source/get_exercises_data_source.dart';
import 'package:fitness_app/features/exercise/domain/entites/get_exercise_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetExercisesDataSource)
class GetExercisesDataSourceImpl implements GetExercisesDataSource {
  ApiClient apiClient;

  GetExercisesDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<ExercisesEntity>>> getExercise(
    String? difficultyLevelId,
    String? primeMoverMuscleId,
  ) async {
    try {
      GetExerciseResponse getExerciseResponse = await apiClient
          .getExercisesByMuscleDifficulty(
            difficultyLevelId,
            primeMoverMuscleId,
          );
      return ApiSuccessResult(
        getExerciseResponse.exercises!
            .map((e) => e.toEntity())
            .cast<ExercisesEntity>()
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null && responseData is Map<String, dynamic>) {
          final message = responseData["message"] ?? "Unknown error";
          return ApiErrorResult<List<ExercisesEntity>>(message.toString());
        }
        return ApiErrorResult<List<ExercisesEntity>>(e.message ?? e.toString());
      }
      return ApiErrorResult<List<ExercisesEntity>>(e.toString());
    }
  }
}
