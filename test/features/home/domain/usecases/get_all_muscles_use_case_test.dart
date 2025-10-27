import 'package:fitness_app/features/home/domain/usecases/get_all_muscles_use_case.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';

import 'get_all_muscles_use_case_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  late MockHomeRepo mockHomeRepo;

  setUpAll(() {
    // Provide dummy values
    provideDummy<ApiResult<List<ExerciseEntity>>>(
      ApiSuccessResult<List<ExerciseEntity>>([]),
    );
    provideDummy<ApiResult<List<MealEntity>>>(
      ApiSuccessResult<List<MealEntity>>([]),
    );
    provideDummy<ApiResult<List<MuscleGroupEntity>?>>(
      ApiSuccessResult<List<MuscleGroupEntity>?>([]),
    );
    provideDummy<ApiResult<List<MuscleEntity>?>>(
      ApiSuccessResult<List<MuscleEntity>?>([]),
    );
  });

  setUp(() {
    mockHomeRepo = MockHomeRepo();
  });

  group('GetAllMusclesUseCase', () {
    late GetAllMusclesUseCase getAllMusclesUseCase;

    setUp(() {
      getAllMusclesUseCase = GetAllMusclesUseCase(mockHomeRepo);
    });

    test('should return ApiSuccessResult from repository', () async {
      // arrange
      final mockMuscles = <MuscleGroupEntity>[];
      final successResult = ApiSuccessResult<List<MuscleGroupEntity>?>(
        mockMuscles,
      );

      when(mockHomeRepo.getAllMuscles()).thenAnswer((_) async => successResult);

      // act
      final result = await getAllMusclesUseCase.call();

      // assert
      expect(result, isA<ApiSuccessResult<List<MuscleGroupEntity>?>>());
      verify(mockHomeRepo.getAllMuscles()).called(1);
    });

    test('should return ApiErrorResult from repository', () async {
      // arrange
      const errorMessage = 'Failed to fetch muscles';
      final errorResult = ApiErrorResult<List<MuscleGroupEntity>?>(
        errorMessage,
      );

      when(mockHomeRepo.getAllMuscles()).thenAnswer((_) async => errorResult);

      // act
      final result = await getAllMusclesUseCase.call();

      // assert
      expect(result, isA<ApiErrorResult<List<MuscleGroupEntity>?>>());
      verify(mockHomeRepo.getAllMuscles()).called(1);
    });
  });
}
