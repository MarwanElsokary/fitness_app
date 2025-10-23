import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/login/data/data_source/login_data_source.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';
import 'package:fitness_app/features/auth/login/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepoImpl(this._loginRemoteDataSource);

  @override
  Future<ApiResult<LoginResponseEntity>> login({
    required LoginRequestEntity loginRequestEntity,
  }) async {
    try {
      var response = await _loginRemoteDataSource.login(
        loginRequestEntity: loginRequestEntity,
      );
      return response;
    } catch (e) {
      return ApiErrorResult<LoginResponseEntity>(e.toString());
    }
  }
}
