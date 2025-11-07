import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/chang_password/data/datasources/contract/change_password_remote_data_source.dart';
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/data/repos_impl/chang_password_repo_impl.dart';
import 'package:fitness_app/features/chang_password/domain/entities/change_password_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'chang_password_repo_impl_test.mocks.dart';

@GenerateMocks([ChangePasswordDataSource])
void main() {
  late MockChangePasswordDataSource mockDataSource;
  late ChangePasswordRepositoryImp repository;

  setUp(() {
    mockDataSource = MockChangePasswordDataSource();
    repository = ChangePasswordRepositoryImp(mockDataSource);
  });
  setUpAll(() {
    provideDummy<ApiResult<ChangePasswordEntity>>(
      ApiSuccessResult(ChangePasswordEntity(message: 'dummy')),
    );
  });
  group('ChangePasswordRepositoryImp', () {
    test('should call dataSource and return ApiSuccessResult', () async {
      // arrange
      final request = ChangePasswordRequestModel(
        oldPassword: '123',
        newPassword: '456',
      );
      final mockEntity = ChangePasswordEntity(message: 'success');
      final mockResult = ApiSuccessResult<ChangePasswordEntity>(mockEntity);

      when(
        mockDataSource.changePassword(any),
      ).thenAnswer((_) async => mockResult);

      // act
      final result = await repository.changePassword(request);

      // assert
      expect(result, isA<ApiSuccessResult<ChangePasswordEntity>>());
      final entity = (result as ApiSuccessResult<ChangePasswordEntity>).data;
      expect(entity.message, 'success');
      verify(mockDataSource.changePassword(any)).called(1);
    });

    test(
      'should return ApiErrorResult when dataSource returns error',
      () async {
        // arrange
        final request = ChangePasswordRequestModel(
          oldPassword: '123',
          newPassword: '456',
        );
        final mockResult = ApiErrorResult<ChangePasswordEntity>(
          'Old password incorrect',
        );

        when(
          mockDataSource.changePassword(any),
        ).thenAnswer((_) async => mockResult);

        // act
        final result = await repository.changePassword(request);

        // assert
        expect(result, isA<ApiErrorResult<ChangePasswordEntity>>());
        final error = result as ApiErrorResult<ChangePasswordEntity>;
        expect(error.errorMessage, 'Old password incorrect');
        verify(mockDataSource.changePassword(any)).called(1);
      },
    );
  });
}
