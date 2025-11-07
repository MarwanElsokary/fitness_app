import 'package:fitness_app/features/home/data/models/muscle_group_dto.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_client/meals_retrofit_client.dart';
import 'package:fitness_app/features/home/data/datasources/impl/home_remote_data_source_impl.dart';
import 'package:fitness_app/features/home/data/models/daily_recommendation_exercise_dto.dart';
import 'package:fitness_app/features/home/data/models/muscles_by_group_response.dart';
import 'package:fitness_app/features/home/data/models/muscles_group_dto.dart';
import 'package:fitness_app/features/home/data/models/recommendation_meals_dto.dart';

import 'home_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient, MealsRetrofitClient])
void main() {
  late MockApiClient mockApiClient;
  late MockMealsRetrofitClient mockMealsRetrofitClient;
  late HomeRemoteDataSourceImpl homeRemoteDataSource;

  setUpAll(() {
    // Provide dummy values
    provideDummy<DailyRecommendationExerciseDto>(
      DailyRecommendationExerciseDto(exercises: []),
    );
    provideDummy<RecommendationMealsDto>(RecommendationMealsDto(meals: []));
    provideDummy<MusclesGroupDto>(MusclesGroupDto("message", []));
    provideDummy<MusclesByGroupResponse>(
      MusclesByGroupResponse("message", MuscleGroupDto(), []),
    );
  });

  setUp(() {
    mockApiClient = MockApiClient();
    mockMealsRetrofitClient = MockMealsRetrofitClient();
    homeRemoteDataSource = HomeRemoteDataSourceImpl(
      mockApiClient,
      mockMealsRetrofitClient,
    );
  });

  group('HomeRemoteDataSourceImpl', () {
    group('getDailyRecommendationExercise', () {
      test(
        'should return DailyRecommendationExerciseDto when API call succeeds',
        () async {
          // arrange
          const limit = 10;
          const targetMuscleGroupId = 'chest';
          const difficultyLevelId = 'beginner';
          final mockResponse = DailyRecommendationExerciseDto(exercises: []);

          when(
            mockApiClient.getDailyRecommendationExercise(
              limit,
              targetMuscleGroupId,
              difficultyLevelId,
            ),
          ).thenAnswer((_) async => mockResponse);

          // act
          final result = await homeRemoteDataSource
              .getDailyRecommendationExercise(
                limit,
                targetMuscleGroupId,
                difficultyLevelId,
              );

          // assert
          expect(result, mockResponse);
          verify(
            mockApiClient.getDailyRecommendationExercise(
              limit,
              targetMuscleGroupId,
              difficultyLevelId,
            ),
          ).called(1);
        },
      );

      test('should throw exception when API call fails', () async {
        // arrange
        const limit = 10;
        const targetMuscleGroupId = 'chest';
        const difficultyLevelId = 'beginner';

        when(
          mockApiClient.getDailyRecommendationExercise(
            limit,
            targetMuscleGroupId,
            difficultyLevelId,
          ),
        ).thenThrow(Exception('Network error'));

        // act & assert
        expect(
          () async => await homeRemoteDataSource.getDailyRecommendationExercise(
            limit,
            targetMuscleGroupId,
            difficultyLevelId,
          ),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('getFoodRecommendation', () {
      test(
        'should return RecommendationMealsDto when API call succeeds',
        () async {
          // arrange
          final mockResponse = RecommendationMealsDto(meals: []);

          when(
            mockMealsRetrofitClient.getFoodRecommendation(),
          ).thenAnswer((_) async => mockResponse);

          // act
          final result = await homeRemoteDataSource.getFoodRecommendation();

          // assert
          expect(result, mockResponse);
          verify(mockMealsRetrofitClient.getFoodRecommendation()).called(1);
        },
      );

      test('should throw exception when API call fails', () async {
        // arrange
        when(
          mockMealsRetrofitClient.getFoodRecommendation(),
        ).thenThrow(Exception('Server error'));

        // act & assert
        expect(
          () async => await homeRemoteDataSource.getFoodRecommendation(),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('getAllMuscles', () {
      test('should retu rn MusclesGroupDto when API call succeeds', () async {
        // arrange
        final mockResponse = MusclesGroupDto('message', []);

        when(
          mockApiClient.getAllMuscles(),
        ).thenAnswer((_) async => mockResponse);

        // act
        final result = await homeRemoteDataSource.getAllMuscles();

        // assert
        expect(result, mockResponse);
        verify(mockApiClient.getAllMuscles()).called(1);
      });
    });

    group('getMusclesByGroup', () {
      test(
        'should return MusclesByGroupResponse when API call succeeds',
        () async {
          // arrange
          const muscleGroupId = 'chest-123';
          final mockResponse = MusclesByGroupResponse(
            "message",
            MuscleGroupDto(),
            [],
          );

          when(
            mockApiClient.getMusclesByGroup(muscleGroupId),
          ).thenAnswer((_) async => mockResponse);

          // act
          final result = await homeRemoteDataSource.getMusclesByGroup(
            muscleGroupId,
          );

          // assert
          expect(result, mockResponse);
          verify(mockApiClient.getMusclesByGroup(muscleGroupId)).called(1);
        },
      );
    });
  });
}
