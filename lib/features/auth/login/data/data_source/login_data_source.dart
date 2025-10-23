import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResult<LoginResponseEntity>> login({
    required LoginRequestEntity loginRequestEntity,
  });
}
