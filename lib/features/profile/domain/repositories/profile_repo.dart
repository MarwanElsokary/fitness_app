import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ApiResult<ProfileEntity>> getProfileData();
  // Future<String?> getToken();
  // Future<void> deleteToken();
}
