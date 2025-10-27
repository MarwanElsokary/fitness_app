import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/api_client.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/api_layer/models/responses/muscles_response.dart';
import 'package:fitness_app/core/api_layer/data_source_impl/workout/muscles_data_source_impl.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockMusclesResponse extends Mock implements MusclesResponse {}

class MockMusclesResponseEntity extends Mock implements MusclesResponseEntity {}

class DummyMuscle implements Muscles {
  final MusclesResponseEntity entity;

  DummyMuscle(this.entity);

  @override
  MusclesResponseEntity toMusclestEntity() => entity;

  @override
  String? get id => throw UnimplementedError();

  @override
  String? get image => throw UnimplementedError();

  @override
  String? get name => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {

    throw UnimplementedError();
  }
}

void main() {
  late MockApiClient apiClient;
  late MusclesDataSourceImpl dataSource;

  setUp(() {
    apiClient = MockApiClient();
    dataSource = MusclesDataSourceImpl(apiClient);
  });

  test(
    'getMuscles returns ApiSuccessResult when apiClient returns data',
    () async {
      final musclesResponse = MockMusclesResponse();
      final entity = MockMusclesResponseEntity();
      when(() => musclesResponse.muscles).thenReturn([DummyMuscle(entity)]);
      when(
        () => apiClient.getMuscleGroup(any()),
      ).thenAnswer((_) async => musclesResponse);

      final result = await dataSource.getMuscles(null);

      expect(result, isA<ApiSuccessResult<List<MusclesResponseEntity>>>());
      final success = result as ApiSuccessResult<List<MusclesResponseEntity>>;
      expect(success.data, isA<List<MusclesResponseEntity>>());
      expect(success.data.length, 1);
    },
  );

  test(
    'getMuscles returns ApiErrorResult with message from DioException response data',
    () async {
      final response = Response(
        requestOptions: RequestOptions(path: ''),
        data: {'message': 'server error'},
      );
      final dioEx = DioException(
        requestOptions: RequestOptions(path: ''),
        response: response,
      );

      when(() => apiClient.getMuscleGroup(any())).thenThrow(dioEx);

      final result = await dataSource.getMuscles('1');

      expect(result, isA<ApiErrorResult<List<MusclesResponseEntity>>>());
    },
  );

  test(
    'getMuscles returns ApiErrorResult for DioException without response data',
    () async {
      final dioEx = DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'network',
      );

      when(() => apiClient.getMuscleGroup(any())).thenThrow(dioEx);

      final result = await dataSource.getMuscles('1');

      expect(result, isA<ApiErrorResult<List<MusclesResponseEntity>>>());
    },
  );

  test('getMuscles returns ApiErrorResult for generic exception', () async {
    when(() => apiClient.getMuscleGroup(any())).thenThrow(Exception('boom'));

    final result = await dataSource.getMuscles('1');

    expect(result, isA<ApiErrorResult<List<MusclesResponseEntity>>>());
  });
}
