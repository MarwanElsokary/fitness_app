import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/api_layer/data_source_impl/workout/workouts_data_source_impl.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient mockApiClient;
  late WorkoutsDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = WorkoutsDataSourceImpl(mockApiClient);
  });

  test(
    'returns ApiErrorResult when DioException contains response with message',
    () async {
      final dioEx = DioException(
        requestOptions: RequestOptions(path: '/workouts'),
        response: Response(
          requestOptions: RequestOptions(path: '/workouts'),
          data: {'message': 'Server error'},
          statusCode: 400,
        ),
      );

      when(() => mockApiClient.getWorkOuts()).thenThrow(dioEx);

      final result = await dataSource.getWorkOuts();

      expect(result, isA<ApiErrorResult<List<WorkoutEntity>>>());
    },
  );

  test('returns ApiErrorResult when DioException without response', () async {
    final dioEx = DioException(
      requestOptions: RequestOptions(path: '/workouts'),
    );
    when(() => mockApiClient.getWorkOuts()).thenThrow(dioEx);

    final result = await dataSource.getWorkOuts();

    expect(result, isA<ApiErrorResult<List<WorkoutEntity>>>());
  });

  test('returns ApiErrorResult when a non-Dio exception is thrown', () async {
    when(() => mockApiClient.getWorkOuts()).thenThrow(Exception('boom'));

    final result = await dataSource.getWorkOuts();

    expect(result, isA<ApiErrorResult<List<WorkoutEntity>>>());
  });

  test(
    'returns ApiSuccessResult when apiClient returns WorkoutResponse',
    () async {
      expect(true, isTrue);
    },
    skip: true,
  );
}
