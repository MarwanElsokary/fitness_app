import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_cubit.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_state.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/workout_body_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkoutCubit extends Mock implements WorkoutCubit {}

void main() {
  late MockWorkoutCubit mockCubit;

  setUp(() {
    mockCubit = MockWorkoutCubit();
  });

  Widget createTestWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider<WorkoutCubit>.value(
        value: mockCubit,
        child: Scaffold(body: child),
      ),
    );
  }

  group('WorkoutBodyBuilder Widget Tests', () {
    testWidgets('shows CircularProgressIndicator when loading', (
      WidgetTester tester,
    ) async {
      when(() => mockCubit.state).thenReturn(WorkOutLoading());
      when(
        () => mockCubit.stream,
      ).thenAnswer((_) => Stream.value(WorkOutLoading()));

      await tester.pumpWidget(createTestWidget(const WorkoutBodyBuilder()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message when WorkOutError state', (
      WidgetTester tester,
    ) async {
      when(
        () => mockCubit.state,
      ).thenReturn(WorkOutError(message: 'Error occurred'));
      when(() => mockCubit.stream).thenAnswer(
        (_) => Stream.value(WorkOutError(message: 'Error occurred')),
      );

      await tester.pumpWidget(createTestWidget(const WorkoutBodyBuilder()));

      expect(find.text('Error occurred'), findsOneWidget);
    });

    testWidgets('shows "No workouts available" when list is empty', (
      WidgetTester tester,
    ) async {
      when(() => mockCubit.state).thenReturn(WorkOutLoaded(workouts: []));
      when(
        () => mockCubit.stream,
      ).thenAnswer((_) => Stream.value(WorkOutLoaded(workouts: [])));

      await tester.pumpWidget(createTestWidget(const WorkoutBodyBuilder()));
      await tester.pumpAndSettle();

      expect(find.text('No workouts available'), findsOneWidget);
    });

    testWidgets('shows workouts tabs when WorkOutLoaded with data', (
      WidgetTester tester,
    ) async {
      final fakeWorkouts = [
        WorkoutEntity(id: '1', name: 'Chest'),
        WorkoutEntity(id: '2', name: 'Legs'),
      ];

      when(
        () => mockCubit.state,
      ).thenReturn(WorkOutLoaded(workouts: fakeWorkouts));
      when(
        () => mockCubit.stream,
      ).thenAnswer((_) => Stream.value(WorkOutLoaded(workouts: fakeWorkouts)));

      await tester.pumpWidget(createTestWidget(const WorkoutBodyBuilder()));
      await tester.pumpAndSettle();

      expect(find.text('Chest'), findsOneWidget);
      expect(find.text('Legs'), findsOneWidget);
      expect(find.text('Workouts'), findsOneWidget);
    });
  });
}
