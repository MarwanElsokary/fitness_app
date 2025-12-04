import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/chang_password/data/datasources/contract/change_password_remote_data_source.dart';
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/data/models/change_password_model.dart';
import 'package:fitness_app/features/chang_password/domain/entities/change_password_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordDataSource)
class ChangePasswordDataSourceImp implements ChangePasswordDataSource {
  final ApiClient _apiClient;

  ChangePasswordDataSourceImp(this._apiClient);
  @override
  Future<ApiResult<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel data,
  ) async {
    // var token=  SharedPreferenceServices.getData(AppConstants.token.toString());
    try {
      ChangePasswordModel changePasswordModel = await _apiClient.changePassword(
        data,
      );
      if (changePasswordModel.message == 'success') {
        return ApiSuccessResult(changePasswordModel);
      } else {
        return ApiErrorResult(changePasswordModel.message ?? "Unknown error");
      }
      //"Bearer $token"
    } on DioException catch (e) {
      return ApiErrorResult(e.message ?? "Unknown Dio error");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
