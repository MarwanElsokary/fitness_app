import 'package:fitness_app/features/workouts/presentation/view_model/workout_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/features/workouts/domain/entites/workout_entity.dart';
import 'package:fitness_app/features/workouts/domain/entites/muscles_response_entity.dart';

void main() {
  group('WorkOutState Tests', () {
    test('WorkOutInitial should be instantiated correctly', () {
      expect(WorkOutInitial(), isA<WorkOutInitial>());
    });

    test('WorkOutLoading should be instantiated correctly', () {
      expect(WorkOutLoading(), isA<WorkOutLoading>());
    });

    test('WorkOutLoaded should hold a list of WorkoutEntity', () {
      final workouts = [
        WorkoutEntity(id: "1", name: 'Push Ups'),
        WorkoutEntity(id: "2", name: 'Squats'),
      ];

      final state = WorkOutLoaded(workouts: workouts);

      expect(state.workouts, isNotNull);
      expect(state.workouts!.length, 2);
      expect(state.workouts![0].name, 'Push Ups');
    });

    test('WorkOutError should hold error message', () {
      const message = 'Something went wrong';
      final state = WorkOutError(message: message);

      expect(state.message, message);
    });

    test('MusclesLoading should be instantiated correctly', () {
      expect(MusclesLoading(), isA<MusclesLoading>());
    });

    test('MusclesLoaded should hold a list of MusclesResponseEntity', () {
      final muscles = [
        MusclesResponseEntity(id: "1", name: 'Biceps'),
        MusclesResponseEntity(id: "2", name: 'Triceps'),
      ];

      final state = MusclesLoaded(muscles: muscles);

      expect(state.muscles, isNotNull);
      expect(state.muscles!.length, 2);
      expect(state.muscles![1].name, 'Triceps');
    });

    test('MusclesError should hold error message', () {
      const message = 'Network Error';
      final state = MusclesError(message: message);

      expect(state.message, message);
    });
  });
}
