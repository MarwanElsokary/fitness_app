import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/profile/domain/entities/profile_entity.dart';
import 'package:fitness_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCase(this._profileRepository);

  Future<ApiResult<ProfileEntity>> call() async {
    return await _profileRepository.getProfileData();
  }
}
