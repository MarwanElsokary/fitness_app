import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/reset_password/request/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/usecases/reset_password_use_case.dart';
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
    // provideDummy<ApiResult<OtpVerificationResponseEntity>>(
    //   ApiSuccessResult<OtpVerificationResponseEntity>(
    //     OtpVerificationResponseEntity(status: 'dummy'),
    //   ),
    // );
    provideDummy<ApiResult<ResetPasswordResponseEntity>>(
      ApiSuccessResult<ResetPasswordResponseEntity>(
        ResetPasswordResponseEntity(message: 'dummy'),
      ),
    );
  });

  setUp(() {
    mockAuthRepo = MockAuthRepo();
  });

  group('ResetPasswordUseCase', () {
    late ResetPasswordUseCase resetPasswordUseCase;

    setUp(() {
      resetPasswordUseCase = ResetPasswordUseCase(mockAuthRepo);
    });

    test(
      'should return ApiSuccessResult from repository',
      () async {
        // arrange
        final requestEntity = ResetPasswordRequestEntity(
          email: 'test@test.com',
          newPassword: 'newPass123',
        
        );
        final mockResponse = ResetPasswordResponseEntity(message: 'success');
        final successResult = ApiSuccessResult<ResetPasswordResponseEntity>(mockResponse);

        when(mockAuthRepo.resetPassword(requestEntity))
            .thenAnswer((_) async => successResult);

        // act
        final result = await resetPasswordUseCase.call(requestEntity);

        // assert
        expect(result, isA<ApiSuccessResult<ResetPasswordResponseEntity>>());
        verify(mockAuthRepo.resetPassword(requestEntity)).called(1);
      },
    );

    test(
      'should return ApiErrorResult from repository',
      () async {
        // arrange
        final requestEntity = ResetPasswordRequestEntity(
          email: 'test@test.com',
          newPassword: 'newPass123',
   
        );
        const errorMessage = 'Invalid token';
        final errorResult = ApiErrorResult<ResetPasswordResponseEntity>(errorMessage);

        when(mockAuthRepo.resetPassword(requestEntity))
            .thenAnswer((_) async => errorResult);

        // act
        final result = await resetPasswordUseCase.call(requestEntity);

        // assert
        expect(result, isA<ApiErrorResult<ResetPasswordResponseEntity>>());
        verify(mockAuthRepo.resetPassword(requestEntity)).called(1);
      },
    );
  });
}