import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';
import 'package:fitness_app/features/auth/login/domain/repo/login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepo _loginRepo;

  LoginUseCase(this._loginRepo);

  Future<ApiResult<LoginResponseEntity>> call({
    required LoginRequestEntity loginRequestEntity,
  }) async {
    return await _loginRepo.login(loginRequestEntity: loginRequestEntity);
  }
}
