import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/domain/entities/change_password_entity.dart';
import 'package:fitness_app/features/chang_password/domain/repositories/chang_password_repo.dart';
import 'package:fitness_app/features/chang_password/domain/usecases/chang_password_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'chang_password_use_case_test.mocks.dart';

@GenerateMocks([ChangePasswordRepository])
void main() {
  late MockChangePasswordRepository mockRepository;
  late ChangePasswordUseCase useCase;

  setUp(() {
    mockRepository = MockChangePasswordRepository();
    useCase = ChangePasswordUseCase(mockRepository);
  });
  setUpAll(() {
    provideDummy<ApiResult<ChangePasswordEntity>>(
      ApiSuccessResult(ChangePasswordEntity(message: 'dummy')),
    );
  });
  group('ChangePasswordUseCase', () {
    test('should call repository and return ApiSuccessResult', () async {
      // arrange
      final request = ChangePasswordRequestModel(
        oldPassword: 'old123',
        newPassword: 'new456',
      );
      final entity = ChangePasswordEntity(message: 'success');
      final mockResult = ApiSuccessResult<ChangePasswordEntity>(entity);

      when(
        mockRepository.changePassword(any),
      ).thenAnswer((_) async => mockResult);

      // act
      final result = await useCase.execute(request);

      // assert
      expect(result, isA<ApiSuccessResult<ChangePasswordEntity>>());
      final success = (result as ApiSuccessResult<ChangePasswordEntity>).data;
      expect(success.message, 'success');
      verify(mockRepository.changePassword(any)).called(1);
    });

    test(
      'should return ApiErrorResult when repository returns error',
      () async {
        // arrange
        final request = ChangePasswordRequestModel(
          oldPassword: 'old123',
          newPassword: 'new456',
        );
        final mockResult = ApiErrorResult<ChangePasswordEntity>(
          'Invalid old password',
        );

        when(
          mockRepository.changePassword(any),
        ).thenAnswer((_) async => mockResult);

        // act
        final result = await useCase.execute(request);

        // assert
        expect(result, isA<ApiErrorResult<ChangePasswordEntity>>());
        final error = result as ApiErrorResult<ChangePasswordEntity>;
        expect(error.errorMessage, 'Invalid old password');
        verify(mockRepository.changePassword(any)).called(1);
      },
    );
  });
}
