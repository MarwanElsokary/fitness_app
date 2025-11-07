import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/chang_password/data/datasources/contract/change_password_remote_data_source.dart';
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/domain/entities/change_password_entity.dart';
import 'package:fitness_app/features/chang_password/domain/repositories/chang_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImp implements ChangePasswordRepository {
  final ChangePasswordDataSource _changePasswordDataSource;

  ChangePasswordRepositoryImp(this._changePasswordDataSource);

  @override
  Future<ApiResult<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel data,
  ) async {
    return await _changePasswordDataSource.changePassword(data);
  }
}
