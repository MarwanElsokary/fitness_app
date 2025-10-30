import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/api_layer/models/responses/all_difficulty_level_by_prime_muscle_response.dart';
import 'package:fitness_app/features/exercise/data/data_source/get_all_difficulty_levels_data_source.dart';
import 'package:fitness_app/features/exercise/domain/entites/all_difficulty_level_by_prime_muscle_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllDifficultyLevelsDataSource)
class GetAllDifficultyLevelsDataSourceImpl
    implements GetAllDifficultyLevelsDataSource {
  ApiClient apiClient;

  GetAllDifficultyLevelsDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<DifficultyLevelsEntity>>> getLevels(
    String? primeMoverMuscleId,
  ) async {
    try {
      AllDifficultyLevelByPrimeMuscleResponse
      allDifficultyLevelByPrimeMuscleResponse = await apiClient
          .getAllDifficultyLevelsByPrimeMoverMuscle(primeMoverMuscleId);
      return ApiSuccessResult(
        allDifficultyLevelByPrimeMuscleResponse.difficultyLevels!
            .map((e) => e.toEntity())
            .cast<DifficultyLevelsEntity>()
            .toList(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null && responseData is Map<String, dynamic>) {
          final message = responseData["message"] ?? "Unknown error";
          return ApiErrorResult<List<DifficultyLevelsEntity>>(
            message.toString(),
          );
        }
        return ApiErrorResult<List<DifficultyLevelsEntity>>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<List<DifficultyLevelsEntity>>(e.toString());
    }
  }
}
