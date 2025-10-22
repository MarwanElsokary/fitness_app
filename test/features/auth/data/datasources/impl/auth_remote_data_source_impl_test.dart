import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/features/auth/data/datasources/impl/auth_remote_data_source_impl.dart';
import 'package:fitness_app/features/auth/data/models/forget_password/request/forget_password_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/forget_password/response/forget_password_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/register/request/register_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/register/response/register_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/otp_verification/request/otp_verification_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/otp_verification/response/otp_verification_response_dto.dart';

import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([
  ApiClient,
])
void main() {
  late MockApiClient mockApiClient;
  late AuthRemoteDataSourceImpl authRemoteDataSource;

  setUpAll(() {
    // Provide dummy values
    provideDummy<ForgetPasswordResponseDto>(
      ForgetPasswordResponseDto(message: 'dummy', error: null),
    );
    provideDummy<RegisterResponseDto>(
      RegisterResponseDto(message: 'dummy', ),
    );
    provideDummy<OtpVerificationResponseDto>(
      OtpVerificationResponseDto(status: 'dummy', error: null),
    );
  });

  setUp(() {
    mockApiClient = MockApiClient();
    authRemoteDataSource = AuthRemoteDataSourceImpl(mockApiClient);
  });

  group('AuthRemoteDataSourceImpl', () {
    group('forgetPassword', () {
      test(
        'should return ForgetPasswordResponseDto when API call succeeds',
        () async {
          // arrange
          final requestDto = ForgetPasswordRequestDto(email: 'test@test.com');
          final mockResponse = ForgetPasswordResponseDto(
            message: 'success',
            error: null,
          );

          when(mockApiClient.forgetPassword(requestDto))
              .thenAnswer((_) async => mockResponse);

          // act
          final result = await authRemoteDataSource.forgetPassword(requestDto);

          // assert
          expect(result, mockResponse);
          expect(result.message, 'success');
          verify(mockApiClient.forgetPassword(requestDto)).called(1);
        },
      );

      test(
        'should throw exception when API call fails',
        () async {
          // arrange
          final requestDto = ForgetPasswordRequestDto(email: 'test@test.com');

          when(mockApiClient.forgetPassword(requestDto))
              .thenThrow(Exception('Network error'));

          // act & assert
          expect(
            () async => await authRemoteDataSource.forgetPassword(requestDto),
            throwsA(isA<Exception>()),
          );
          verify(mockApiClient.forgetPassword(requestDto)).called(1);
        },
      );
    });

    group('register', () {
      test(
        'should return RegisterResponseDto when API call succeeds',
        () async {
          // arrange
          final requestDto = RegisterRequestDto(
            email: 'test@test.com',
            password: '123456',
            firstName: 'Test User',
          );
          final mockResponse = RegisterResponseDto(
            message: 'success',
          );

          when(mockApiClient.register(requestDto))
              .thenAnswer((_) async => mockResponse);

          // act
          final result = await authRemoteDataSource.register(requestDto);

          // assert
          expect(result, mockResponse);
          expect(result.message, 'success');
          verify(mockApiClient.register(requestDto)).called(1);
        },
      );

      test(
        'should throw exception when API call fails',
        () async {
          // arrange
          final requestDto = RegisterRequestDto(
            email: 'test@test.com',
            password: '123456',
            firstName: 'Test User',
          );

          when(mockApiClient.register(requestDto))
              .thenThrow(Exception('Server error'));

          // act & assert
          expect(
            () async => await authRemoteDataSource.register(requestDto),
            throwsA(isA<Exception>()),
          );
          verify(mockApiClient.register(requestDto)).called(1);
        },
      );
    });

    group('verifyOtp', () {
      test(
        'should return OtpVerificationResponseDto when API call succeeds',
        () async {
          // arrange
          final requestDto = OtpVerificationRequestDto(
          
           resetCode: '123456',
          );
          final mockResponse = OtpVerificationResponseDto(
            status: 'success',
            error: null,
          );

          when(mockApiClient.verifyOtp(requestDto))
              .thenAnswer((_) async => mockResponse);

          // act
          final result = await authRemoteDataSource.verifyOtp(requestDto);

          // assert
          expect(result, mockResponse);
          expect(result.status, 'success');
          verify(mockApiClient.verifyOtp(requestDto)).called(1);
        },
      );
    });
  });
}