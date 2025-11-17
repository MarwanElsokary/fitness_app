import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/features/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileDTO> getProfileData();
  Future<void> logout();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProfileDTO> getProfileData() async {
    return await _apiClient.getProfileData();
  }

  @override
  Future<void> logout() async {
    await _apiClient.logout();
  }
}
