import 'package:fitness_app/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/otp_verification/response/otp_verification_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';

import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([
  AuthRepo,
])
void main() {
  late MockAuthRepo mockAuthRepo;

  setUpAll(() {
    // Provide dummy values
    provideDummy<ApiResult<ForgetPasswordResponseEntity>>(
      ApiSuccessResult<ForgetPasswordResponseEntity>(
        ForgetPasswordResponseEntity(message: 'dummy'),
      ),
    );
    provideDummy<ApiResult<RegisterResponseEntity>>(
      ApiSuccessResult<RegisterResponseEntity>(
        RegisterResponseEntity(message: 'dummy'),
      ),
    );
    provideDummy<ApiResult<OtpVerificationResponseEntity>>(
      ApiSuccessResult<OtpVerificationResponseEntity>(
        OtpVerificationResponseEntity(status: 'dummy'),
      ),
    );
    provideDummy<ApiResult<ResetPasswordResponseEntity>>(
      ApiSuccessResult<ResetPasswordResponseEntity>(
        ResetPasswordResponseEntity(message: 'dummy'),
      ),
    );
  });

  setUp(() {
    mockAuthRepo = MockAuthRepo();
  });

  group('ForgetPasswordUseCase', () {
    late ForgetPasswordUseCase forgetPasswordUseCase;

    setUp(() {
      forgetPasswordUseCase = ForgetPasswordUseCase(mockAuthRepo);
    });

    test(
      'should return ApiSuccessResult from repository',
      () async {
        // arrange
        final requestEntity = ForgetPasswordRequestEntity(email: 'test@test.com');
        final mockResponse = ForgetPasswordResponseEntity(message: 'success');
        final successResult = ApiSuccessResult<ForgetPasswordResponseEntity>(mockResponse);

        when(mockAuthRepo.forgetPassword(requestEntity))
            .thenAnswer((_) async => successResult);

        // act
        final result = await forgetPasswordUseCase.call(requestEntity);

        // assert
        expect(result, isA<ApiSuccessResult<ForgetPasswordResponseEntity>>());
        verify(mockAuthRepo.forgetPassword(requestEntity)).called(1);
      },
    );

    test(
      'should return ApiErrorResult from repository',
      () async {
        // arrange
        final requestEntity = ForgetPasswordRequestEntity(email: 'test@test.com');
        const errorMessage = 'Email not found';
        final errorResult = ApiErrorResult<ForgetPasswordResponseEntity>(errorMessage);

        when(mockAuthRepo.forgetPassword(requestEntity))
            .thenAnswer((_) async => errorResult);

        // act
        final result = await forgetPasswordUseCase.call(requestEntity);

        // assert
        expect(result, isA<ApiErrorResult<ForgetPasswordResponseEntity>>());
        verify(mockAuthRepo.forgetPassword(requestEntity)).called(1);
      },
    );
  });

 




}