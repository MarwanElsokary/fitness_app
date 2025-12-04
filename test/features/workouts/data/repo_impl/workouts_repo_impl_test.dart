// language: dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fitness_app/features/workouts/data/repo_impl/workouts_repo_impl.dart';
import 'package:fitness_app/features/workouts/data/data_source/workout_data_source.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';

class MockWorkoutDataSource extends Mock implements WorkoutDataSource {}

void main() {
  late MockWorkoutDataSource mockDataSource;
  late WorkoutsRepoImpl repo;

  setUp(() {
    mockDataSource = MockWorkoutDataSource();
    repo = WorkoutsRepoImpl(mockDataSource);
  });

  test('getWorkOuts forwards call to data source and returns its result', () async {
    final expected = ApiSuccessResult<List<WorkoutEntity>>(<WorkoutEntity>[]);
    when(() => mockDataSource.getWorkOuts()).thenAnswer((_) async => expected);

    final result = await repo.getWorkOuts();

    expect(result, same(expected));
    verify(() => mockDataSource.getWorkOuts()).called(1);
    verifyNoMoreInteractions(mockDataSource);
  });

  test('getWorkOuts propagates exceptions from data source', () async {
    final exception = Exception('network error');
    when(() => mockDataSource.getWorkOuts()).thenThrow(exception);

    expect(() => repo.getWorkOuts(), throwsA(same(exception)));
    verify(() => mockDataSource.getWorkOuts()).called(1);
  });
}