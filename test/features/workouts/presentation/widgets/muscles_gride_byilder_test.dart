import 'package:fitness_app/features/workouts/presentation/view_model/workout_cubit.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_state.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/muscles_gride_byilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkoutCubit extends Mock implements WorkoutCubit {}

void main() {
  late MockWorkoutCubit mockCubit;

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider<WorkoutCubit>.value(
        value: mockCubit,
        child: Scaffold(body: child),
      ),
    );
  }

  setUp(() {
    mockCubit = MockWorkoutCubit();
  });

  testWidgets('shows loading indicator when state is MusclesLoading', (
    tester,
  ) async {
    when(() => mockCubit.state).thenReturn(MusclesLoading());
    when(
      () => mockCubit.stream,
    ).thenAnswer((_) => Stream.value(MusclesLoading()));

    await tester.pumpWidget(makeTestableWidget(const MusclesGrideByilder()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows error message when state is MusclesError', (tester) async {
    when(() => mockCubit.state).thenReturn(MusclesError(message: 'error'));
    when(
      () => mockCubit.stream,
    ).thenAnswer((_) => Stream.value(MusclesError(message: 'error')));

    await tester.pumpWidget(makeTestableWidget(const MusclesGrideByilder()));

    expect(find.text('error'), findsOneWidget);
  });
}
