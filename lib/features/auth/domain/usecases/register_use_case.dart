import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo);

  Future<ApiResult<RegisterResponseEntity>> call(
    RegisterRequestEntity request,
  ) async {
    return await _authRepo.register(request);
  }
}
