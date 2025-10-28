// dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/workouts/data/data_source/muscles_data_source.dart';
import 'package:fitness_app/features/workouts/data/repo_impl/muscles_repo_impl.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';

class _MockMusclesDataSource extends Mock implements MusclesDataSource {}

void main() {
  late _MockMusclesDataSource mockDataSource;
  late MusclesRepoImpl repo;

  setUp(() {
    mockDataSource = _MockMusclesDataSource();
    repo = MusclesRepoImpl(mockDataSource);
  });

  test('forwards ApiSuccessResult from data source', () async {
    final entities = <MusclesResponseEntity>[];
    final expected = ApiSuccessResult<List<MusclesResponseEntity>>(entities);

    when(() => mockDataSource.getMuscles('group1'))
        .thenAnswer((_) async => expected);

    final result = await repo.getMuscles('group1');

    expect(result, same(expected));
    verify(() => mockDataSource.getMuscles('group1')).called(1);
  });

  test('forwards ApiErrorResult from data source', () async {
    final expected = ApiErrorResult<List<MusclesResponseEntity>>('err');

    when(() => mockDataSource.getMuscles(null))
        .thenAnswer((_) async => expected);

    final result = await repo.getMuscles(null);

    expect(result, same(expected));
    verify(() => mockDataSource.getMuscles(null)).called(1);
  });

  test('propagates exception from data source', () async {
    when(() => mockDataSource.getMuscles('x'))
        .thenThrow(Exception('source failure'));

    expect(() => repo.getMuscles('x'), throwsA(isA<Exception>()));
    verify(() => mockDataSource.getMuscles('x')).called(1);
  });
}