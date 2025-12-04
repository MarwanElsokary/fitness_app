import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';
import 'package:fitness_app/features/home/domain/repositories/home_repo.dart';
import 'package:fitness_app/features/home/domain/usecases/get_food_recommendation_use_case.dart';
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
  group('GetFoodRecommendationUseCase', () {
    late GetFoodRecommendationUseCase getFoodRecommendationUseCase;

    setUp(() {
      getFoodRecommendationUseCase = GetFoodRecommendationUseCase(mockHomeRepo);
    });

    test('should return ApiSuccessResult from repository', () async {
      // arrange
      final mockMeals = <MealEntity>[];
      final successResult = ApiSuccessResult<List<MealEntity>>(mockMeals);

      when(
        mockHomeRepo.getFoodRecommendation(),
      ).thenAnswer((_) async => successResult);

      // act
      final result = await getFoodRecommendationUseCase.call();

      // assert
      expect(result, isA<ApiSuccessResult<List<MealEntity>>>());
      verify(mockHomeRepo.getFoodRecommendation()).called(1);
    });

    test('should return ApiErrorResult from repository', () async {
      // arrange
      const errorMessage = 'No meals available';
      final errorResult = ApiErrorResult<List<MealEntity>>(errorMessage);

      when(
        mockHomeRepo.getFoodRecommendation(),
      ).thenAnswer((_) async => errorResult);

      // act
      final result = await getFoodRecommendationUseCase.call();

      // assert
      expect(result, isA<ApiErrorResult<List<MealEntity>>>());
      verify(mockHomeRepo.getFoodRecommendation()).called(1);
    });
  });
}
