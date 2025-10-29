import 'package:fitness_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';

void main() {
  group('LoginStates', () {
    test('LoginInitState can be instantiated', () {
      final state = LoginInitState();
      expect(state, isA<LoginInitState>());
    });

    test('LoginLoadingState can be instantiated', () {
      final state = LoginLoadingState();
      expect(state, isA<LoginLoadingState>());
    });

    test('LoginSuccessState holds the login response entity', () {
      final response = LoginResponseEntity(token: 'token123', message: 'success');
      final state = LoginSuccessState(response);

      expect(state, isA<LoginSuccessState>());
      expect(state.loginResponseEntity, response);
    });

    test('LoginErrorState holds the error message', () {
      final state = LoginErrorState('Error occurred');

      expect(state, isA<LoginErrorState>());
      expect(state.message, 'Error occurred');
    });
  });
}
