import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/models/responses/muscles_response.dart';
import 'package:fitness_app/core/api_layer/models/responses/login_response_dto.dart';
import 'package:fitness_app/core/api_layer/models/responses/workout_response.dart';
import 'package:fitness_app/features/auth/data/models/forget_password/request/forget_password_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/forget_password/response/forget_password_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/otp_verification/request/otp_verification_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/otp_verification/response/otp_verification_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/register/request/register_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/register/response/register_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/reset_password/request/reset_password_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/reset_password/response/reset_password_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/requests/login_request_dto.dart';
import 'endpoints.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.sampleEndpoint)
  Future<String> getSampleData();

  @POST(Endpoints.signUp)
  Future<RegisterResponseDto> register(@Body() RegisterRequestDto request);

  @POST(Endpoints.forgotPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(
    @Body() ForgetPasswordRequestDto request,
  );

  @POST(Endpoints.verifyResetCode)
  Future<OtpVerificationResponseDto> verifyOtp(
    @Body() OtpVerificationRequestDto request,
  );

  @PUT(Endpoints.resetPassword)
  Future<ResetPasswordResponseDto> resetPassword(
    @Body() ResetPasswordRequestDto request,
  );

  @POST(Endpoints.login)
  Future<HttpResponse<LoginResponseDto>> login({
    @Body() required LoginRequestDto loginRequestDto,
  });

  @GET(Endpoints.workout)
  Future<WorkoutResponse> getWorkOuts();

  @GET(Endpoints.muscleGroupById)
  Future<MusclesResponse> getMuscleGroup(
    @Query("muscleGroupId") String? muscleGroupId,
  );
}
