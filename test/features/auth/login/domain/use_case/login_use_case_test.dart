import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';
import 'package:fitness_app/features/auth/login/domain/repo/login_repo.dart';
import 'package:fitness_app/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepo extends Mock implements LoginRepo {}

class FakeLoginRequestEntity extends Fake implements LoginRequestEntity {}

void main() {
  late MockLoginRepo mockRepo;
  late LoginUseCase loginUseCase;

  setUpAll(() {
    registerFallbackValue(FakeLoginRequestEntity());
  });

  setUp(() {
    mockRepo = MockLoginRepo();
    loginUseCase = LoginUseCase(mockRepo);
  });

  final tLoginRequest = LoginRequestEntity(
    email: 'test@test.com',
    password: '123456',
  );
  final tLoginResponse = LoginResponseEntity(
    token: 'token123',
    message: 'Success',
  );

  test('should return ApiSuccessResult when login is successful', () async {
    // arrange
    when(
      () =>
          mockRepo.login(loginRequestEntity: any(named: 'loginRequestEntity')),
    ).thenAnswer((_) async => ApiSuccessResult(tLoginResponse));

    // act
    final result = await loginUseCase.call(loginRequestEntity: tLoginRequest);

    // assert
    expect(result, isA<ApiSuccessResult<LoginResponseEntity>>());
    expect((result as ApiSuccessResult).data, tLoginResponse);
    verify(() => mockRepo.login(loginRequestEntity: tLoginRequest)).called(1);
    verifyNoMoreInteractions(mockRepo);
  });

  test('should return ApiErrorResult when login fails', () async {
    // arrange
    when(
      () =>
          mockRepo.login(loginRequestEntity: any(named: 'loginRequestEntity')),
    ).thenAnswer((_) async => ApiErrorResult('Login failed'));

    // act
    final result = await loginUseCase.call(loginRequestEntity: tLoginRequest);

    // assert
    expect(result, isA<ApiErrorResult<LoginResponseEntity>>());
    expect((result as ApiErrorResult).errorMessage, 'Login failed');
    verify(() => mockRepo.login(loginRequestEntity: tLoginRequest)).called(1);
    verifyNoMoreInteractions(mockRepo);
  });
}
