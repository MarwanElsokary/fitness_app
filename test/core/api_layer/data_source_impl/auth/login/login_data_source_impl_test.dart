import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/api_layer/data_source_impl/auth/login/login_data_source_impl.dart';
import 'package:fitness_app/core/api_layer/models/requests/login_request_dto.dart';
import 'package:fitness_app/core/api_layer/models/responses/login_response_dto.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retrofit/retrofit.dart';

class MockApiClient extends Mock implements ApiClient {}

class FakeLoginRequestEntity extends Fake implements LoginRequestEntity {}

void main() {
  late MockApiClient mockApiClient;
  late LoginRemoteDataSourceImpl dataSource;

  setUpAll(() {
    registerFallbackValue(LoginRequestDto(email: '', password: ''));
  });

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = LoginRemoteDataSourceImpl(mockApiClient);
  });

  group('LoginRemoteDataSourceImpl', () {
    test('✅ returns ApiSuccessResult when statusCode is 200', () async {
      // Arrange
      final loginRequest = LoginRequestEntity(
        email: 'test@mail.com',
        password: '1234',
      );
      final loginResponseDto = LoginResponseDto(
        token: 'token123',
        message: 'Success',
      );

      final httpResponse = HttpResponse<LoginResponseDto>(
        loginResponseDto,
        Response(
          requestOptions: RequestOptions(path: '/login'),
          statusCode: 200,
        ),
      );

      when(
        () =>
            mockApiClient.login(loginRequestDto: any(named: 'loginRequestDto')),
      ).thenAnswer((_) async => httpResponse);

      // Act
      final result = await dataSource.login(loginRequestEntity: loginRequest);

      // Assert
      expect(result, isA<ApiSuccessResult<LoginResponseEntity>>());
      final success = result as ApiSuccessResult<LoginResponseEntity>;
      expect(success.data.token, equals('token123'));
      verify(
        () =>
            mockApiClient.login(loginRequestDto: any(named: 'loginRequestDto')),
      ).called(1);
    });

    test('❌ returns ApiErrorResult when statusCode is not 200', () async {
      // Arrange
      final loginRequest = LoginRequestEntity(
        email: 'fail@mail.com',
        password: 'wrong',
      );
      final loginResponseDto = LoginResponseDto(
        token: '',
        message: 'Invalid credentials',
      );

      final httpResponse = HttpResponse<LoginResponseDto>(
        loginResponseDto,
        Response(
          requestOptions: RequestOptions(path: '/login'),
          statusCode: 400,
        ),
      );

      when(
        () =>
            mockApiClient.login(loginRequestDto: any(named: 'loginRequestDto')),
      ).thenAnswer((_) async => httpResponse);

      // Act
      final result = await dataSource.login(loginRequestEntity: loginRequest);

      // Assert
      expect(result, isA<ApiErrorResult<LoginResponseEntity>>());
      final error = result as ApiErrorResult<LoginResponseEntity>;
      expect(error.errorMessage, contains('Invalid credentials'));
      verify(
        () =>
            mockApiClient.login(loginRequestDto: any(named: 'loginRequestDto')),
      ).called(1);
    });

    test('⚠️ returns ApiErrorResult when exception is thrown', () async {
      // Arrange
      final loginRequest = LoginRequestEntity(
        email: 'error@mail.com',
        password: 'oops',
      );
      when(
        () =>
            mockApiClient.login(loginRequestDto: any(named: 'loginRequestDto')),
      ).thenThrow(Exception('Network error'));

      // Act
      final result = await dataSource.login(loginRequestEntity: loginRequest);

      // Assert
      expect(result, isA<ApiErrorResult<LoginResponseEntity>>());
      final error = result as ApiErrorResult<LoginResponseEntity>;
      expect(error.errorMessage, contains('Network error'));
      verify(
        () =>
            mockApiClient.login(loginRequestDto: any(named: 'loginRequestDto')),
      ).called(1);
    });
  });
}
