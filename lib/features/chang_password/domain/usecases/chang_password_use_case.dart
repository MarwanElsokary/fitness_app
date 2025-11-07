import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/domain/entities/change_password_entity.dart';
import 'package:fitness_app/features/chang_password/domain/repositories/chang_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepository _changePasswordRepository;

  ChangePasswordUseCase(this._changePasswordRepository);

  Future<ApiResult<ChangePasswordEntity>> execute(
    ChangePasswordRequestModel data,
  ) {
    return _changePasswordRepository.changePassword(data);
  }
}
