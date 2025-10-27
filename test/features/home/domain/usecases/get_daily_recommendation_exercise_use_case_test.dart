import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';
import 'package:fitness_app/features/home/domain/usecases/get_daily_recommendation_exercise_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
  group('GetDailyRecommendationExerciseUseCase', () {
    late GetDailyRecommendationExerciseUseCase
    getDailyRecommendationExerciseUseCase;

    setUp(() {
      getDailyRecommendationExerciseUseCase =
          GetDailyRecommendationExerciseUseCase(mockHomeRepo);
    });

    test('should return ApiSuccessResult from repository', () async {
      // arrange
      const limit = 10;
      const targetMuscleGroupId = 'chest';
      const difficultyLevelId = 'beginner';
      final mockExercises = <ExerciseEntity>[];
      final successResult = ApiSuccessResult<List<ExerciseEntity>>(
        mockExercises,
      );

      when(
        mockHomeRepo.getDailyRecommendationExercise(
          limit,
          targetMuscleGroupId,
          difficultyLevelId,
        ),
      ).thenAnswer((_) async => successResult);

      // act
      final result = await getDailyRecommendationExerciseUseCase.call(
        limit,
        targetMuscleGroupId,
        difficultyLevelId,
      );

      // assert
      expect(result, isA<ApiSuccessResult<List<ExerciseEntity>>>());
      verify(
        mockHomeRepo.getDailyRecommendationExercise(
          limit,
          targetMuscleGroupId,
          difficultyLevelId,
        ),
      ).called(1);
    });

    test('should return ApiErrorResult from repository', () async {
      // arrange
      const limit = 10;
      const targetMuscleGroupId = 'chest';
      const difficultyLevelId = 'beginner';
      const errorMessage = 'Failed to fetch exercises';
      final errorResult = ApiErrorResult<List<ExerciseEntity>>(errorMessage);

      when(
        mockHomeRepo.getDailyRecommendationExercise(
          limit,
          targetMuscleGroupId,
          difficultyLevelId,
        ),
      ).thenAnswer((_) async => errorResult);

      // act
      final result = await getDailyRecommendationExerciseUseCase.call(
        limit,
        targetMuscleGroupId,
        difficultyLevelId,
      );

      // assert
      expect(result, isA<ApiErrorResult<List<ExerciseEntity>>>());
      verify(
        mockHomeRepo.getDailyRecommendationExercise(
          limit,
          targetMuscleGroupId,
          difficultyLevelId,
        ),
      ).called(1);
    });
  });
}
