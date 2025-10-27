// dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fitness_app/features/workouts/domain/use_case/workout_use_case.dart';
import 'package:fitness_app/features/workouts/domain/repo/workouts_repo.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';

class MockWorkoutsRepo extends Mock implements WorkoutsRepo {}

class MockApiResult extends Mock implements ApiSuccessResult<List<WorkoutEntity>> {}

void main() {
  late MockWorkoutsRepo mockRepo;
  late WorkoutUseCase useCase;

  setUp(() {
    mockRepo = MockWorkoutsRepo();
    useCase = WorkoutUseCase(mockRepo);
  });

  test('forwards repository ApiResult', () async {
    final apiResult = MockApiResult();
    when(() => mockRepo.getWorkOuts()).thenAnswer((_) async => apiResult);

    final result = await useCase.call();

    expect(result, same(apiResult));
    verify(() => mockRepo.getWorkOuts()).called(1);
  });

  test('propagates exceptions thrown by repository', () async {
    when(() => mockRepo.getWorkOuts()).thenThrow(Exception('repo failure'));

    expect(() => useCase.call(), throwsA(isA<Exception>()));
    verify(() => mockRepo.getWorkOuts()).called(1);
  });
}