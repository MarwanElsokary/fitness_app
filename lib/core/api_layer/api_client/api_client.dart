import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/models/responses/all_difficulty_level_by_prime_muscle_response.dart';
import 'package:fitness_app/core/api_layer/models/responses/get_exercise_response.dart';
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
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/data/models/change_password_model.dart';
import 'package:fitness_app/features/home/data/models/daily_recommendation_exercise_dto.dart';
import 'package:fitness_app/features/home/data/models/muscles_by_group_response.dart';
import 'package:fitness_app/features/home/data/models/muscles_group_dto.dart';
import 'package:fitness_app/features/profile/data/models/profile_dto.dart';
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

  @PATCH(Endpoints.changePassword)
  Future<ChangePasswordModel> changePassword(
    @Body() ChangePasswordRequestModel data,
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

  //Home
  @GET(Endpoints.exercisesByRandom)
  Future<DailyRecommendationExerciseDto> getDailyRecommendationExercise(
    @Query('limit') int limit,
    @Query('targetMuscleGroupId') String targetMuscleGroupId,
    @Query('difficultyLevelId') String difficultyLevelId,
  );

  @GET(Endpoints.allMuscles)
  Future<MusclesGroupDto> getAllMuscles();

  @GET("${Endpoints.allMusclesGroup}/{id}")
  Future<MusclesByGroupResponse> getMusclesByGroup(@Path("id") String id);

  @GET(Endpoints.exercisesByMuscleDifficulty)
  Future<GetExerciseResponse> getExercisesByMuscleDifficulty(
    @Query('difficultyLevelId') String? difficultyLevelId,
    @Query('primeMoverMuscleId') String? primeMoverMuscleId,
  );

  @GET(Endpoints.getAllDifficultyLevelsByPrimeMoverMuscle)
  Future<AllDifficultyLevelByPrimeMuscleResponse>
  getAllDifficultyLevelsByPrimeMoverMuscle(
    @Query('primeMoverMuscleId') String? primeMoverMuscleId,
  );

  @GET(Endpoints.getProfileData)
  Future<ProfileDTO> getProfileData();

  @GET(Endpoints.logout)
  Future<HttpResponse<void>> logout();
}
