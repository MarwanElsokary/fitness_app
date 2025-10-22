import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/data/datasources/intract/auth_remote_data_source.dart';
import 'package:fitness_app/features/auth/data/models/forget_password/response/forget_password_response_dto.dart';
import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/otp_verification/request/otp_verification_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/otp_verification/response/otp_verification_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/reset_password/request/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';
import '../models/forget_password/request/forget_password_request_dto.dart';
import '../models/otp_verification/request/otp_verification_request_dto.dart';
import '../models/reset_password/request/reset_password_request_dto.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> forgetPassword(
    ForgetPasswordRequestEntity request,
  ) async {
    try {
      ForgetPasswordResponseDto forgetPasswordResponseDto =
          await _authRemoteDataSource.forgetPassword(
            ForgetPasswordRequestDto.fromDomain(request),
          );

      if (forgetPasswordResponseDto.message == "success") {
        return ApiSuccessResult(forgetPasswordResponseDto.toEntity());
      } else {
        return ApiErrorResult(
          forgetPasswordResponseDto.error ?? "Unknown error",
        );
      }
    } on DioException catch (e) {
      return ApiErrorResult(e.message ?? "Unknown Dio error");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
    ResetPasswordRequestEntity request,
  ) async {
    try {
      var response = await _authRemoteDataSource.resetPassword(
        ResetPasswordRequestDto.fromDomain(request),
      );
      return ApiSuccessResult(response.toEntity());
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }

  @override
  Future<ApiResult<OtpVerificationResponseEntity>> verifyOtp(
    OtpVerificationRequestEntity request,
  ) async {
    try {
      var response = await _authRemoteDataSource.verifyOtp(
        OtpVerificationRequestDto.fromDomain(request),
      );
      return ApiSuccessResult(response.toEntity());
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
