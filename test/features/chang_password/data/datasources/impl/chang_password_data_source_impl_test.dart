import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/chang_password/data/datasources/impl/chang_password_data_source_impl.dart';
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/data/models/change_password_model.dart';
import 'package:fitness_app/features/chang_password/domain/entities/change_password_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'chang_password_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late ChangePasswordDataSourceImp changePasswordDataSource;

  setUpAll(() {
    provideDummy<ChangePasswordModel>(ChangePasswordModel(message: 'dummy'));
    provideDummy<ChangePasswordRequestModel>(
      ChangePasswordRequestModel(oldPassword: 'dummy', newPassword: 'dummy'),
    );
  });

  setUp(() {
    mockApiClient = MockApiClient();
    changePasswordDataSource = ChangePasswordDataSourceImp(mockApiClient);
  });

  group('ChangePasswordDataSourceImp', () {
    group('changePassword', () {
      test('should return ApiSuccessResult when message is success', () async {
        // arrange
        final requestModel = ChangePasswordRequestModel(
          oldPassword: 'oldPass123',
          newPassword: 'newPass456',
        );
        final mockResponse = ChangePasswordModel(message: 'success');

        when(
          mockApiClient.changePassword(any),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await changePasswordDataSource.changePassword(
          requestModel,
        );

        // assert
        expect(result, isA<ApiSuccessResult<ChangePasswordEntity>>());
        final entity = (result as ApiSuccessResult<ChangePasswordEntity>).data;
        expect(entity.message, 'success');
        verify(mockApiClient.changePassword(any)).called(1);
      });

      test(
        'should return ApiErrorResult when message is not success',
        () async {
          // arrange
          final requestModel = ChangePasswordRequestModel(
            oldPassword: 'oldPass123',
            newPassword: 'newPass456',
          );
          final mockResponse = ChangePasswordModel(
            message: 'Old password is incorrect',
          );

          when(
            mockApiClient.changePassword(any),
          ).thenAnswer((_) async => mockResponse);

          // act
          final result = await changePasswordDataSource.changePassword(
            requestModel,
          );

          // assert
          expect(result, isA<ApiErrorResult<ChangePasswordEntity>>());
          final error = result as ApiErrorResult<ChangePasswordEntity>;
          expect(error.errorMessage, 'Old password is incorrect');
          verify(mockApiClient.changePassword(any)).called(1);
        },
      );

      test(
        'should return ApiErrorResult when DioException is thrown',
        () async {
          // arrange
          final requestModel = ChangePasswordRequestModel(
            oldPassword: 'oldPass123',
            newPassword: 'newPass456',
          );

          final dioException = DioException(
            requestOptions: RequestOptions(path: ''),
            message: 'Network error',
          );

          when(mockApiClient.changePassword(any)).thenThrow(dioException);

          // act
          final result = await changePasswordDataSource.changePassword(
            requestModel,
          );

          // assert
          expect(result, isA<ApiErrorResult<ChangePasswordEntity>>());
          final error = result as ApiErrorResult<ChangePasswordEntity>;
          expect(error.errorMessage, 'Network error');
          verify(mockApiClient.changePassword(any)).called(1);
        },
      );

      test('should throw Exception when unexpected error occurs', () async {
        // arrange
        final requestModel = ChangePasswordRequestModel(
          oldPassword: 'oldPass123',
          newPassword: 'newPass456',
        );

        when(
          mockApiClient.changePassword(any),
        ).thenThrow(Exception('Unexpected error'));

        // act & assert
        expect(
          () async =>
              await changePasswordDataSource.changePassword(requestModel),
          throwsA(isA<Exception>()),
        );
        verify(mockApiClient.changePassword(any)).called(1);
      });
    });
  });
}
