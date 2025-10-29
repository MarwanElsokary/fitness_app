import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/features/workouts/presentation/view/workout_screen.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_cubit.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workout_state.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/workout_body_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkoutCubit extends MockCubit<WorkOutState>
    implements WorkoutCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockWorkoutCubit mockWorkoutCubit;

  setUpAll(() {
    registerFallbackValue(WorkOutInitial());
  });

  setUp(() async {
    mockWorkoutCubit = MockWorkoutCubit();

    when(() => mockWorkoutCubit.state).thenReturn(WorkOutInitial());

    whenListen(
      mockWorkoutCubit,
      const Stream<WorkOutState>.empty(),
      initialState: WorkOutInitial(),
    );

    when(() => mockWorkoutCubit.getWorkOuts()).thenAnswer((_) async {});

    await getIt.reset();

    getIt.registerFactory<WorkoutCubit>(() => mockWorkoutCubit);
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('WorkoutScreen builds correctly and calls getWorkOuts() once', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: WorkoutScreen()));

    await tester.pumpAndSettle();

    //  verify getWorkOuts called once
    verify(() => mockWorkoutCubit.getWorkOuts()).called(1);

    // verify core widgets
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(WorkoutBodyBuilder), findsOneWidget);

    //  verify background image exists
    final bgFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Container &&
          widget.decoration is BoxDecoration &&
          (widget.decoration as BoxDecoration).image != null,
    );
    expect(bgFinder, findsOneWidget);
  });
}
