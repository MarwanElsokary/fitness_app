import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/modules/shared_preferences_module.dart';
import 'package:fitness_app/core/resources/app_constants.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_request_entity.dart';
import 'package:fitness_app/features/auth/login/domain/models/login_response_entity.dart';
import 'package:fitness_app/features/auth/login/domain/use_case/login_use_case.dart';
import 'package:fitness_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;
  final SharedPrefHelper sharedPrefHelper;

  // Final properties for keys and controllers for consistency
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false; // Initialize non-nullable bool safely

  LoginViewModel({
    required this.loginUseCase,
    required this.sharedPrefHelper,
  }) : super(LoginInitState());

  void login() async {
    // CRITICAL FIX: Use the safe null check operator (?.) and coalesce (?? false).
    // This prevents the "Null check operator used on a null value" crash
    // in unit tests where formKey.currentState is null.
    final bool isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      // If validation fails (in UI) or key is unattached (in unit test),
      // the function simply exits without crashing or making an API call.
      return;
    }

    // Check if the cubit is closed before emitting
    if (isClosed) return;

    emit(LoginLoadingState());

    try {
      final requestEntity = LoginRequestEntity(
        email: emailController.text,
        password: passwordController.text,
      );

      final response = await loginUseCase.call(
        loginRequestEntity: requestEntity,
      );

      // Check if the cubit is closed before emitting after the async call
      if (isClosed) return;

      switch (response) {
        case ApiSuccessResult<LoginResponseEntity> successResponse:
        // Use pattern matching alias for clarity (successResponse)

        // 1. Save token (only if rememberMe is true, or always if required)
        // Assuming we always save the token for session management:
          await sharedPrefHelper.setValue(
            AppConstants.tokenKey,
            successResponse.data.token,
          );

          emit(LoginSuccessState(successResponse.data));
          break;

        case ApiErrorResult<LoginResponseEntity> errorResponse:
        // Use pattern matching alias for clarity (errorResponse)
          emit(LoginErrorState(errorResponse.errorMessage));
          break;
      }
    } catch (e) {
      // Check if the cubit is closed before emitting error
      if (isClosed) return;

      // Use the actual error message
      emit(LoginErrorState(e.toString()));
    }
  }

  /// Toggles the rememberMe state and should be called by the UI.
  void toggleRememberMe(bool? newValue) {
    if (newValue != null) {
      rememberMe = newValue;
      // Optionally emit a state if the UI needs to react to this change
    }
  }

  @override
  Future<void> close() {
    // Dispose controllers to prevent memory leaks
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}