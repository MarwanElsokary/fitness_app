import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/domain/entities/change_password_entity.dart';

abstract class ChangePasswordDataSource {
  Future<ApiResult<ChangePasswordEntity>> changePassword(
    ChangePasswordRequestModel data,
  );
}
