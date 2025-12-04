import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/login/data/data_source/login_data_source.dart';
import 'package:fitness_app/features/auth/login/data/repo_impl/login_repo_impl.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRemoteDataSource extends Mock implements LoginRemoteDataSource {}

class FakeLoginRequestEntity extends Fake implements LoginRequestEntity {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeLoginRequestEntity());
  });

  late MockLoginRemoteDataSource mockDataSource;
  late LoginRepoImpl loginRepo;

  setUp(() {
    mockDataSource = MockLoginRemoteDataSource();
    loginRepo = LoginRepoImpl(mockDataSource);
  });

  group('LoginRepoImpl', () {
    test(
      '✅ returns ApiSuccessResult when data source returns success',
      () async {
        // Arrange
        final loginRequest = LoginRequestEntity(
          email: 'user@mail.com',
          password: '1234',
        );
        final loginResponse = LoginResponseEntity(
          token: 'token123',
          message: 'Login successful',
        );

        when(
          () => mockDataSource.login(
            loginRequestEntity: any(named: 'loginRequestEntity'),
          ),
        ).thenAnswer((_) async => ApiSuccessResult(loginResponse));

        // Act
        final result = await loginRepo.login(loginRequestEntity: loginRequest);

        // Assert
        expect(result, isA<ApiSuccessResult<LoginResponseEntity>>());
        final success = result as ApiSuccessResult<LoginResponseEntity>;
        expect(success.data.token, equals('token123'));
        expect(success.data.message, equals('Login successful'));
        verify(
          () => mockDataSource.login(
            loginRequestEntity: any(named: 'loginRequestEntity'),
          ),
        ).called(1);
      },
    );

    test('❌ returns ApiErrorResult when data source returns error', () async {
      // Arrange
      final loginRequest = LoginRequestEntity(
        email: 'fail@mail.com',
        password: 'wrong',
      );
      when(
        () => mockDataSource.login(
          loginRequestEntity: any(named: 'loginRequestEntity'),
        ),
      ).thenAnswer(
        (_) async => ApiErrorResult<LoginResponseEntity>('Invalid credentials'),
      );

      // Act
      final result = await loginRepo.login(loginRequestEntity: loginRequest);

      // Assert
      expect(result, isA<ApiErrorResult<LoginResponseEntity>>());
      final error = result as ApiErrorResult<LoginResponseEntity>;
      expect(error.errorMessage, equals('Invalid credentials'));
      verify(
        () => mockDataSource.login(
          loginRequestEntity: any(named: 'loginRequestEntity'),
        ),
      ).called(1);
    });

    test('⚠️ returns ApiErrorResult when an exception is thrown', () async {
      // Arrange
      final loginRequest = LoginRequestEntity(
        email: 'error@mail.com',
        password: 'oops',
      );
      when(
        () => mockDataSource.login(
          loginRequestEntity: any(named: 'loginRequestEntity'),
        ),
      ).thenThrow(Exception('Network failure'));

      // Act
      final result = await loginRepo.login(loginRequestEntity: loginRequest);

      // Assert
      expect(result, isA<ApiErrorResult<LoginResponseEntity>>());
      final error = result as ApiErrorResult<LoginResponseEntity>;
      expect(error.errorMessage, contains('Network failure'));
      verify(
        () => mockDataSource.login(
          loginRequestEntity: any(named: 'loginRequestEntity'),
        ),
      ).called(1);
    });
  });
}
