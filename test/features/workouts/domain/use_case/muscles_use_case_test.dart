// dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/domain/use_case/muscles_use_case.dart';
import 'package:fitness_app/features/workouts/domain/repo/muscles_repo.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';

class MockMusclesRepo extends Mock implements MusclesRepo {}

class MockApiResult extends Mock implements ApiSuccessResult<List<MusclesResponseEntity>> {}

void main() {
  late MockMusclesRepo repo;
  late MusclesUseCase useCase;

  setUp(() {
    repo = MockMusclesRepo();
    useCase = MusclesUseCase(repo);
  });

  test('forwards call to repository and returns repository result (null id)', () async {
    final expected = MockApiResult();
    when(() => repo.getMuscles(null)).thenAnswer((_) async => expected);

    final result = await useCase.call(null);

    verify(() => repo.getMuscles(null)).called(1);
    expect(result, same(expected));
  });

  test('forwards call to repository and returns repository result (non-null id)', () async {
    final expected = MockApiResult();
    const muscleGroupId = 'chest';
    when(() => repo.getMuscles(muscleGroupId)).thenAnswer((_) async => expected);

    final result = await useCase.call(muscleGroupId);

    verify(() => repo.getMuscles(muscleGroupId)).called(1);
    expect(result, same(expected));
  });
}