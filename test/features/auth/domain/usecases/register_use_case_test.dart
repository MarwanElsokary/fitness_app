import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/usecases/register_use_case.dart';
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
    
    provideDummy<ApiResult<RegisterResponseEntity>>(
      ApiSuccessResult<RegisterResponseEntity>(
        RegisterResponseEntity(message: 'dummy'),
      ),
    );
    
  });

  setUp(() {
    mockAuthRepo = MockAuthRepo();
  });

   group('RegisterUseCase', () {
    late RegisterUseCase registerUseCase;

    setUp(() {
      registerUseCase = RegisterUseCase(mockAuthRepo);
    });

    test(
      'should return ApiSuccessResult from repository',
      () async {
        // arrange
        final requestEntity = RegisterRequestEntity(
          email: 'test@test.com',
          password: '123456',
          firstName: 'Test User',
        );
        final mockResponse = RegisterResponseEntity(message: 'success');
        final successResult = ApiSuccessResult<RegisterResponseEntity>(mockResponse);

        when(mockAuthRepo.register(requestEntity))
            .thenAnswer((_) async => successResult);

        // act
        final result = await registerUseCase.call(requestEntity);

        // assert
        expect(result, isA<ApiSuccessResult<RegisterResponseEntity>>());
        verify(mockAuthRepo.register(requestEntity)).called(1);
      },
    );

    test(
      'should return ApiErrorResult from repository',
      () async {
        // arrange
        final requestEntity = RegisterRequestEntity(
          email: 'test@test.com',
          password: '123456',
          firstName: 'Test User',
        );
        const errorMessage = 'Email already exists';
        final errorResult = ApiErrorResult<RegisterResponseEntity>(errorMessage);

        when(mockAuthRepo.register(requestEntity))
            .thenAnswer((_) async => errorResult);

        // act
        final result = await registerUseCase.call(requestEntity);

        // assert
        expect(result, isA<ApiErrorResult<RegisterResponseEntity>>());
        verify(mockAuthRepo.register(requestEntity)).called(1);
      },
    );
  });
}