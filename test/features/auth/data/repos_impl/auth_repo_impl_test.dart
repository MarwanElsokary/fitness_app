import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/data/datasources/intract/auth_remote_data_source.dart';
import 'package:fitness_app/features/auth/data/models/forget_password/response/forget_password_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/register/response/register_response_dto.dart';
import 'package:fitness_app/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/register/register_response_entity.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([
  AuthRemoteDataSource,
])
void main() {
  late MockAuthRemoteDataSource mockDataSource;
  late AuthRepoImpl authRepoImpl;

  setUpAll(() {
    // Provide dummy values
    provideDummy<ForgetPasswordResponseDto>(
      ForgetPasswordResponseDto(message: 'dummy', error: null),
    );
    provideDummy<RegisterResponseDto>(
      RegisterResponseDto(message: 'dummy',),
    );
  });

  setUp(() {
    mockDataSource = MockAuthRemoteDataSource();
    authRepoImpl = AuthRepoImpl(mockDataSource);
  });

  group('AuthRepoImpl', () {
    group('forgetPassword', () {
      test(
        'should return ApiSuccessResult when message is success',
        () async {
          // arrange
          final requestEntity = ForgetPasswordRequestEntity(email: 'test@test.com');
          final mockDto = ForgetPasswordResponseDto(
            message: 'success',
            error: null,
          );
          
          when(mockDataSource.forgetPassword(any))
              .thenAnswer((_) async => mockDto);

          // act
          final result = await authRepoImpl.forgetPassword(requestEntity);

          // assert
          expect(result, isA<ApiSuccessResult<ForgetPasswordResponseEntity>>());
          verify(mockDataSource.forgetPassword(any)).called(1);
        },
      );

      test(
        'should return ApiErrorResult when message is not success',
        () async {
          // arrange
          final requestEntity = ForgetPasswordRequestEntity(email: 'test@test.com');
          final mockDto = ForgetPasswordResponseDto(
            message: 'failed',
            error: 'Email not found',
          );
          
          when(mockDataSource.forgetPassword(any))
              .thenAnswer((_) async => mockDto);

          // act
          final result = await authRepoImpl.forgetPassword(requestEntity);

          // assert
          expect(result, isA<ApiErrorResult<ForgetPasswordResponseEntity>>());
          final error = result as ApiErrorResult<ForgetPasswordResponseEntity>;
          expect(error.errorMessage, 'Email not found');
          verify(mockDataSource.forgetPassword(any)).called(1);
        },
      );

      test(
        'should return ApiErrorResult when DioException is thrown',
        () async {
          // arrange
          final requestEntity = ForgetPasswordRequestEntity(email: 'test@test.com');
          final dioException = DioException(
            requestOptions: RequestOptions(path: ''),
            message: 'Network error',
          );
          
          when(mockDataSource.forgetPassword(any))
              .thenThrow(dioException);

          // act
          final result = await authRepoImpl.forgetPassword(requestEntity);

          // assert
          expect(result, isA<ApiErrorResult<ForgetPasswordResponseEntity>>());
          final error = result as ApiErrorResult<ForgetPasswordResponseEntity>;
          expect(error.errorMessage, 'Network error');
        },
      );
    });

    group('register', () {
      test(
        'should return ApiSuccessResult when message is success',
        () async {
          // arrange
          final requestEntity = RegisterRequestEntity(
            email: 'test@test.com',
            password: '123456',
            firstName: 'Test User',
          );
          final mockDto = RegisterResponseDto(
            message: 'success',
          );
          
          when(mockDataSource.register(any))
              .thenAnswer((_) async => mockDto);

          // act
          final result = await authRepoImpl.register(requestEntity);

          // assert
          expect(result, isA<ApiSuccessResult<RegisterResponseEntity>>());
          verify(mockDataSource.register(any)).called(1);
        },
      );

      test(
        'should return ApiErrorResult when message is not success',
        () async {
          // arrange
          final requestEntity = RegisterRequestEntity(
            email: 'test@test.com',
            password: '123456',
            firstName: 'Test User',
          );
          final mockDto = RegisterResponseDto(
            message: 'Email already exists',
          );
          
          when(mockDataSource.register(any))
              .thenAnswer((_) async => mockDto);

          // act
          final result = await authRepoImpl.register(requestEntity);

          // assert
          expect(result, isA<ApiErrorResult<RegisterResponseEntity>>());
          final error = result as ApiErrorResult<RegisterResponseEntity>;
          expect(error.errorMessage, 'Email already exists');
        },
      );
    });
  });
}