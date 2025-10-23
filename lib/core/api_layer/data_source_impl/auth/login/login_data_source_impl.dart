import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/api_layer/models/requests/login_request_dto.dart';
import 'package:fitness_app/features/auth/login/data/data_source/login_data_source.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiClient _apiClient;

  LoginRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<LoginResponseEntity>> login({
    required LoginRequestEntity loginRequestEntity,
  }) async {
    try {
      var response = await _apiClient.login(
        loginRequestDto: LoginRequestDto(
          email: loginRequestEntity.email,
          password: loginRequestEntity.password,
        ),
      );
      var statusCode = response.response.statusCode ?? 500;
      var responseBody = response.data;
      if (statusCode >= 200 && statusCode < 300) {
        return ApiSuccessResult<LoginResponseEntity>(responseBody.toEntity());
      } else {
        return ApiErrorResult<LoginResponseEntity>(
          responseBody.message ?? "An error occurred",
        );
      }
    } catch (e) {
      return ApiErrorResult<LoginResponseEntity>(e.toString());
    }
  }
}
