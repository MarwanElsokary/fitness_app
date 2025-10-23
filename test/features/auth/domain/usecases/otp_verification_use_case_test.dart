import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/otp_verification/request/otp_verification_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/otp_verification/response/otp_verification_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/usecases/otp_verification_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([
  AuthRepo,
])
void main() {
late MockAuthRepo mockAuthRepo;

  setUpAll(() {
    // Provide dummy values
    // provideDummy<ApiResult<ForgetPasswordResponseEntity>>(
    //   ApiSuccessResult<ForgetPasswordResponseEntity>(
    //     ForgetPasswordResponseEntity(message: 'dummy'),
    //   ),
    // );
    // provideDummy<ApiResult<RegisterResponseEntity>>(
    //   ApiSuccessResult<RegisterResponseEntity>(
    //     RegisterResponseEntity(message: 'dummy'),
    //   ),
    // );
    provideDummy<ApiResult<OtpVerificationResponseEntity>>(
      ApiSuccessResult<OtpVerificationResponseEntity>(
        OtpVerificationResponseEntity(status: 'dummy'),
      ),
    );
    // provideDummy<ApiResult<ResetPasswordResponseEntity>>(
    //   ApiSuccessResult<ResetPasswordResponseEntity>(
    //     ResetPasswordResponseEntity(message: 'dummy'),
    //   ),
    // );
  });

  setUp(() {
    mockAuthRepo = MockAuthRepo();
  });
  group('OtpVerificationUseCase', () {
    late OtpVerificationUseCase otpVerificationUseCase;

    setUp(() {
      otpVerificationUseCase = OtpVerificationUseCase(mockAuthRepo);
    });

    test(
      'should return ApiSuccessResult from repository',
      () async {
        // arrange
        final requestEntity = OtpVerificationRequestEntity(
          resetCode: '123456',
        );
        final mockResponse = OtpVerificationResponseEntity(status: 'success');
        final successResult = ApiSuccessResult<OtpVerificationResponseEntity>(mockResponse);

        when(mockAuthRepo.verifyOtp(requestEntity))
            .thenAnswer((_) async => successResult);

        // act
        final result = await otpVerificationUseCase.call(requestEntity);

        // assert
        expect(result, isA<ApiSuccessResult<OtpVerificationResponseEntity>>());
        verify(mockAuthRepo.verifyOtp(requestEntity)).called(1);
      },
    );

    test(
      'should return ApiErrorResult from repository',
      () async {
        // arrange
        final requestEntity = OtpVerificationRequestEntity(
         resetCode: '123456',
        );
        const errorMessage = 'Invalid OTP';
        final errorResult = ApiErrorResult<OtpVerificationResponseEntity>(errorMessage);

        when(mockAuthRepo.verifyOtp(requestEntity))
            .thenAnswer((_) async => errorResult);

        // act
        final result = await otpVerificationUseCase.call(requestEntity);

        // assert
        expect(result, isA<ApiErrorResult<OtpVerificationResponseEntity>>());
        verify(mockAuthRepo.verifyOtp(requestEntity)).called(1);
      },
    );
  });
}