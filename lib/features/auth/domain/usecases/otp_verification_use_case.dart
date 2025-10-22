import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/otp_verification/request/otp_verification_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/otp_verification/response/otp_verification_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtpVerificationUseCase {
  final AuthRepo _authRepo;

  OtpVerificationUseCase(this._authRepo);

  Future<ApiResult<OtpVerificationResponseEntity>> call(
    OtpVerificationRequestEntity request,
  ) async => await _authRepo.verifyOtp(request);
}
