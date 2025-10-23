import 'package:fitness_app/features/auth/data/models/register/request/register_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/register/response/register_response_dto.dart';

import '../../models/forget_password/request/forget_password_request_dto.dart';
import '../../models/forget_password/response/forget_password_response_dto.dart';
import '../../models/otp_verification/request/otp_verification_request_dto.dart';
import '../../models/otp_verification/response/otp_verification_response_dto.dart';
import '../../models/reset_password/request/reset_password_request_dto.dart';
import '../../models/reset_password/response/reset_password_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponseDto> register(RegisterRequestDto request);

  Future<ForgetPasswordResponseDto> forgetPassword(
    ForgetPasswordRequestDto request,
  );

  Future<OtpVerificationResponseDto> verifyOtp(
    OtpVerificationRequestDto request,
  );

  Future<ResetPasswordResponseDto> resetPassword(
    ResetPasswordRequestDto request,
  );
}
