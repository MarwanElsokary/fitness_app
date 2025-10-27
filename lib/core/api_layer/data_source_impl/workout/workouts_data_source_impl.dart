import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/api_layer/models/responses/workout_response.dart';
import 'package:fitness_app/features/workouts/data/data_source/workout_data_source.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WorkoutDataSource)
class WorkoutsDataSourceImpl implements WorkoutDataSource {
  ApiClient apiClient;

  WorkoutsDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<WorkoutEntity>>> getWorkOuts() async {
    try {
      WorkoutResponse workoutResponse = await apiClient.getWorkOuts();
      return ApiSuccessResult(
        workoutResponse.musclesGroup!.map((e) => e.toCategoryEntity()).toList(),
      );
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null && responseData is Map<String, dynamic>) {
          final message = responseData["message"] ?? "Unknown error";
          return ApiErrorResult<List<WorkoutEntity>>(message.toString());
        }
        return ApiErrorResult<List<WorkoutEntity>>(e.message ?? e.toString());
      }
      return ApiErrorResult<List<WorkoutEntity>>(e.toString());
    }
  }
}
