import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:fitness_app/features/profile/domain/entities/profile_entity.dart';
import 'package:fitness_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl(this._profileRemoteDataSource);

  @override
  Future<ApiResult<ProfileEntity>> getProfileData() async {
    try {
      var data = await _profileRemoteDataSource.getProfileData();
      // SharedPreferenceServices.saveData(AppConstants.firstName, data.user?.firstName??"");
      if (data.message == 'success' || data.message == 'Success') {
        return ApiSuccessResult(data.toEntity());
      } else {
        return ApiErrorResult(data.message ?? 'no message error');
      }
    } on Exception catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
