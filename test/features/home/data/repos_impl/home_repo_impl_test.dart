import 'package:dio/dio.dart';
import 'package:fitness_app/features/home/data/models/meal_dto.dart';
import 'package:fitness_app/features/home/data/models/muscle_group_dto.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/home/data/datasources/contract/home_remote_data_source.dart';
import 'package:fitness_app/features/home/data/models/daily_recommendation_exercise_dto.dart';
import 'package:fitness_app/features/home/data/models/muscles_by_group_response.dart';
import 'package:fitness_app/features/home/data/models/muscles_group_dto.dart';
import 'package:fitness_app/features/home/data/models/recommendation_meals_dto.dart';
import 'package:fitness_app/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:fitness_app/features/home/domain/entities/exercise_entity.dart';
import 'package:fitness_app/features/home/domain/entities/meal_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_entity.dart';
import 'package:fitness_app/features/home/domain/entities/muscle_group_entity.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSource])
void main() {
  late MockHomeRemoteDataSource mockDataSource;
  late HomeRepoImpl homeRepoImpl;

  setUpAll(() {
    // Provide dummy values
    provideDummy<DailyRecommendationExerciseDto>(
      DailyRecommendationExerciseDto(message: 'dummy', exercises: []),
    );
    provideDummy<RecommendationMealsDto>(RecommendationMealsDto(meals: []));
    provideDummy<MusclesGroupDto>(MusclesGroupDto('dummy', []));
    provideDummy<MusclesByGroupResponse>(
      MusclesByGroupResponse('dummy', MuscleGroupDto(), []),
    );
  });

  setUp(() {
    mockDataSource = MockHomeRemoteDataSource();
    homeRepoImpl = HomeRepoImpl(mockDataSource);
  });

  group('HomeRepoImpl', () {
    group('getDailyRecommendationExercise', () {
      test('should return ApiSuccessResult when message is success', () async {
        // arrange
        const limit = 10;
        const targetMuscleGroupId = 'chest';
        const difficultyLevelId = 'beginner';
        final mockDto = DailyRecommendationExerciseDto(
          message: 'success',
          exercises: [],
        );

        when(
          mockDataSource.getDailyRecommendationExercise(
            limit,
            targetMuscleGroupId,
            difficultyLevelId,
          ),
        ).thenAnswer((_) async => mockDto);

        // act
        final result = await homeRepoImpl.getDailyRecommendationExercise(
          limit,
          targetMuscleGroupId,
          difficultyLevelId,
        );

        // assert
        expect(result, isA<ApiSuccessResult<List<ExerciseEntity>>>());
        verify(
          mockDataSource.getDailyRecommendationExercise(
            limit,
            targetMuscleGroupId,
            difficultyLevelId,
          ),
        ).called(1);
      });

      test(
        'should return ApiErrorResult when message is not success',
        () async {
          // arrange
          const limit = 10;
          const targetMuscleGroupId = 'chest';
          const difficultyLevelId = 'beginner';
          final mockDto = DailyRecommendationExerciseDto(
            message: 'failed',
            exercises: [],
          );

          when(
            mockDataSource.getDailyRecommendationExercise(
              limit,
              targetMuscleGroupId,
              difficultyLevelId,
            ),
          ).thenAnswer((_) async => mockDto);

          // act
          final result = await homeRepoImpl.getDailyRecommendationExercise(
            limit,
            targetMuscleGroupId,
            difficultyLevelId,
          );

          // assert
          expect(result, isA<ApiErrorResult<List<ExerciseEntity>>>());
          final error = result as ApiErrorResult<List<ExerciseEntity>>;
          expect(error.errorMessage, 'failed');
        },
      );

      test(
        'should return ApiErrorResult when DioException is thrown',
        () async {
          // arrange
          const limit = 10;
          const targetMuscleGroupId = 'chest';
          const difficultyLevelId = 'beginner';
          final dioException = DioException(
            requestOptions: RequestOptions(path: ''),
            message: 'Network error',
          );

          when(
            mockDataSource.getDailyRecommendationExercise(
              limit,
              targetMuscleGroupId,
              difficultyLevelId,
            ),
          ).thenThrow(dioException);

          // act
          final result = await homeRepoImpl.getDailyRecommendationExercise(
            limit,
            targetMuscleGroupId,
            difficultyLevelId,
          );

          // assert
          expect(result, isA<ApiErrorResult<List<ExerciseEntity>>>());
          final error = result as ApiErrorResult<List<ExerciseEntity>>;
          expect(error.errorMessage, 'Network error');
        },
      );
    });

    group('getFoodRecommendation', () {
      test(
        'should return ApiSuccessResult when meals list is not empty',
        () async {
          // arrange
          final mockDto = RecommendationMealsDto(
            meals: [MealDto(idCategory: '1', strCategory: 'Test Meal')],
          );

          when(
            mockDataSource.getFoodRecommendation(),
          ).thenAnswer((_) async => mockDto);

          // act
          final result = await homeRepoImpl.getFoodRecommendation();

          // assert
          expect(result, isA<ApiSuccessResult<List<MealEntity>>>());
          verify(mockDataSource.getFoodRecommendation()).called(1);
        },
      );

      test('should return ApiErrorResult when meals list is empty', () async {
        // arrange
        final mockDto = RecommendationMealsDto(meals: []);

        when(
          mockDataSource.getFoodRecommendation(),
        ).thenAnswer((_) async => mockDto);

        // act
        final result = await homeRepoImpl.getFoodRecommendation();

        // assert
        expect(result, isA<ApiErrorResult<List<MealEntity>>>());
        final error = result as ApiErrorResult<List<MealEntity>>;
        expect(error.errorMessage, 'food not found');
      });
    });

    group('getAllMuscles', () {
      test('should return ApiSuccessResult when message is success', () async {
        // arrange
        final mockDto = MusclesGroupDto('success', []);

        when(mockDataSource.getAllMuscles()).thenAnswer((_) async => mockDto);

        // act
        final result = await homeRepoImpl.getAllMuscles();

        // assert
        expect(result, isA<ApiSuccessResult<List<MuscleGroupEntity>?>>());
        verify(mockDataSource.getAllMuscles()).called(1);
      });

      test(
        'should return ApiErrorResult when message is not success',
        () async {
          // arrange
          final mockDto = MusclesGroupDto('failed', []);

          when(mockDataSource.getAllMuscles()).thenAnswer((_) async => mockDto);

          // act
          final result = await homeRepoImpl.getAllMuscles();

          // assert
          expect(result, isA<ApiErrorResult<List<MuscleGroupEntity>?>>());
        },
      );
    });

    group('getMusclesByGroup', () {
      test('should return ApiSuccessResult when message is success', () async {
        // arrange
        const muscleGroupId = 'chest-123';
        final mockDto = MusclesByGroupResponse('success', MuscleGroupDto(), []);

        when(
          mockDataSource.getMusclesByGroup(muscleGroupId),
        ).thenAnswer((_) async => mockDto);

        // act
        final result = await homeRepoImpl.getMusclesByGroup(muscleGroupId);

        // assert
        expect(result, isA<ApiSuccessResult<List<MuscleEntity>?>>());
        verify(mockDataSource.getMusclesByGroup(muscleGroupId)).called(1);
      });

      test(
        'should return ApiErrorResult when message is not success',
        () async {
          // arrange
          const muscleGroupId = 'chest-123';
          final mockDto = MusclesByGroupResponse(
            'failed',
            MuscleGroupDto(),
            [],
          );

          when(
            mockDataSource.getMusclesByGroup(muscleGroupId),
          ).thenAnswer((_) async => mockDto);

          // act
          final result = await homeRepoImpl.getMusclesByGroup(muscleGroupId);

          // assert
          expect(result, isA<ApiErrorResult<List<MuscleEntity>?>>());
        },
      );
    });
  });
}
