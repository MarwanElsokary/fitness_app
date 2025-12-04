import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/api_layer/models/responses/muscles_response.dart';
import 'package:fitness_app/features/workouts/data/data_source/muscles_data_source.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MusclesDataSource)
class MusclesDataSourceImpl implements MusclesDataSource {
  ApiClient apiClient;

  MusclesDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<MusclesResponseEntity>>> getMuscles(
    String? muscleGroupId,
  ) async {
    try {
      MusclesResponse musclesResponse = await apiClient.getMuscleGroup(
        muscleGroupId,
      );
      return ApiSuccessResult(
        musclesResponse.muscles!.map((e) => e.toMusclestEntity()).toList(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null && responseData is Map<String, dynamic>) {
          final message = responseData["message"] ?? "Unknown error";
          return ApiErrorResult<List<MusclesResponseEntity>>(
            message.toString(),
          );
        }
        return ApiErrorResult<List<MusclesResponseEntity>>(
          e.message ?? e.toString(),
        );
      }
      return ApiErrorResult<List<MusclesResponseEntity>>(e.toString());
    }
  }
}
