import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_cubit.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fitness_app/features/workouts/domain/use_case/workout_use_case.dart';
import 'package:fitness_app/features/workouts/domain/use_case/muscles_use_case.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';

class MockWorkoutUseCase extends Mock implements WorkoutUseCase {}

class MockMusclesUseCase extends Mock implements MusclesUseCase {}

void main() {
  late WorkoutCubit cubit;
  late MockWorkoutUseCase mockWorkoutUseCase;
  late MockMusclesUseCase mockMusclesUseCase;

  setUp(() {
    mockWorkoutUseCase = MockWorkoutUseCase();
    mockMusclesUseCase = MockMusclesUseCase();
    cubit = WorkoutCubit(mockMusclesUseCase, mockWorkoutUseCase);
  });

  group('WorkoutCubit', () {
    final workouts = [
      WorkoutEntity(id: "1", name: "Push Ups"),
      WorkoutEntity(id: "2", name: "Squats"),
    ];

    final muscles = [
      MusclesResponseEntity(id: "1", name: "Biceps"),
      MusclesResponseEntity(id: "2", name: "Triceps"),
    ];

    blocTest<WorkoutCubit, WorkOutState>(
      'emits [WorkOutLoading, WorkOutLoaded, MusclesLoading, MusclesLoaded] when getWorkOuts succeeds',
      build: () {
        when(
          () => mockWorkoutUseCase.call(),
        ).thenAnswer((_) async => ApiSuccessResult(workouts));

        when(
          () => mockMusclesUseCase.call(any()),
        ).thenAnswer((_) async => ApiSuccessResult(muscles));

        return cubit;
      },
      act: (cubit) => cubit.getWorkOuts(),
      expect: () => [
        isA<WorkOutLoading>(),
        isA<WorkOutLoaded>(),
        isA<MusclesLoading>(),
        isA<MusclesLoaded>(),
      ],
      verify: (_) {
        verify(() => mockWorkoutUseCase.call()).called(1);
        verify(() => mockMusclesUseCase.call("1")).called(1);
      },
    );

    blocTest<WorkoutCubit, WorkOutState>(
      'emits [WorkOutLoading, WorkOutError] when getWorkOuts fails',
      build: () {
        when(
          () => mockWorkoutUseCase.call(),
        ).thenAnswer((_) async => ApiErrorResult("Network Error"));
        return cubit;
      },
      act: (cubit) => cubit.getWorkOuts(),
      expect: () => [
        isA<WorkOutLoading>(),
        predicate(
          (state) => state is WorkOutError && state.message == "Network Error",
        ),
      ],
    );

    blocTest<WorkoutCubit, WorkOutState>(
      'emits [MusclesLoading, MusclesLoaded] when getMuscles succeeds',
      build: () {
        when(
          () => mockMusclesUseCase.call("1"),
        ).thenAnswer((_) async => ApiSuccessResult(muscles));
        return cubit;
      },
      act: (cubit) => cubit.getMuscles("1"),
      expect: () => [isA<MusclesLoading>(), isA<MusclesLoaded>()],
    );

    blocTest<WorkoutCubit, WorkOutState>(
      'emits [MusclesLoading, MusclesError] when getMuscles fails',
      build: () {
        when(
          () => mockMusclesUseCase.call("1"),
        ).thenAnswer((_) async => ApiErrorResult("Server Error"));
        return cubit;
      },
      act: (cubit) => cubit.getMuscles("1"),
      expect: () => [
        isA<MusclesLoading>(),
        predicate(
          (state) => state is MusclesError && state.message == "Server Error",
        ),
      ],
    );
  });
}
