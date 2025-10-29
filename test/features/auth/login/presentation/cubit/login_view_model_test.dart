import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/features/auth/login/presentation/cubit/login_view_model.dart';
import 'package:fitness_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:fitness_app/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:fitness_app/core/modules/shared_preferences_module.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockSharedPrefHelper extends Mock implements SharedPrefHelper {}

class FakeLoginRequestEntity extends Fake implements LoginRequestEntity {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(FakeLoginRequestEntity());
  });

  late LoginViewModel viewModel;
  late MockLoginUseCase mockLoginUseCase;
  late MockSharedPrefHelper mockSharedPrefHelper;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockSharedPrefHelper = MockSharedPrefHelper();

    viewModel = LoginViewModel(
      loginUseCase: mockLoginUseCase,
      sharedPrefHelper: mockSharedPrefHelper,
    );

    viewModel.emailController.clear();
    viewModel.passwordController.clear();
    viewModel.rememberMe = false;
  });

  tearDown(() async {
    await viewModel.close();
  });

  test('Initial state is LoginInitState', () {
    expect(viewModel.state, isA<LoginInitState>());
  });

  test('ViewModel components are correctly initialized', () {
    expect(viewModel.emailController, isA<TextEditingController>());
    expect(viewModel.passwordController, isA<TextEditingController>());
    expect(viewModel.formKey, isA<GlobalKey<FormState>>());
    expect(viewModel.rememberMe, isFalse);
  });

  test(
    'login() exits immediately when validation fails (unattached FormState)',
    () async {
      viewModel.emailController.text = '';
      viewModel.passwordController.text = '';

      final emittedStates = <LoginStates>[];
      final sub = viewModel.stream.listen(emittedStates.add);

      viewModel.login();
      await Future.delayed(const Duration(milliseconds: 10));

      expect(emittedStates, isEmpty);

      verifyNever(
        () => mockLoginUseCase.call(
          loginRequestEntity: any(named: 'loginRequestEntity'),
        ),
      );

      await sub.cancel();
    },
  );

  test(
    'login() does nothing if form validation fails (due to unattached key in test)',
    () async {
      viewModel.emailController.text = '';
      viewModel.passwordController.text = '';

      final emittedStates = <LoginStates>[];
      final sub = viewModel.stream.listen(emittedStates.add);

      viewModel.login();
      await Future.delayed(const Duration(milliseconds: 10));

      expect(emittedStates, isEmpty);

      verifyNever(
        () => mockLoginUseCase.call(
          loginRequestEntity: any(named: 'loginRequestEntity'),
        ),
      );

      await sub.cancel();
    },
  );

  test('toggleRememberMe sets the value correctly', () {
    expect(viewModel.rememberMe, isFalse);

    viewModel.toggleRememberMe(true);
    expect(viewModel.rememberMe, isTrue);

    viewModel.toggleRememberMe(false);
    expect(viewModel.rememberMe, isFalse);

    viewModel.toggleRememberMe(null);
    expect(viewModel.rememberMe, isFalse);
  });
}
