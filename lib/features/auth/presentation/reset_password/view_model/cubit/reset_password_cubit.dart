import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/domain/entities/reset_password/request/reset_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/reset_password/response/reset_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  final Validator validator;

  ResetPasswordCubit(this._resetPasswordUseCase, this.validator)
    : super(ResetPasswordState(baseState: BaseInitialState()));

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void doIntent(ResetPasswordAction action) {
    switch (action) {
      case ResetPasswordSendAction():
        {
          _resetPassword();
        }
      case FormDataChangedAction():
        {
          _validateForm();
        }
      case ToggleNewPasswordVisibility():
        {
          _toggleNewPasswordVisibility();
        }
      case ToggleConfirmPasswordVisibility():
        {
          _toggleConfirmPasswordVisibility();
        }
    }
  }

  Future<void> _resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(baseState: BaseLoadingState()));
      final result = await _resetPasswordUseCase(
        ResetPasswordRequestEntity(
          email: emailController.text,
          newPassword: newPasswordController.text,
        ),
      );
      switch (result) {
        case ApiSuccessResult<ResetPasswordResponseEntity>():
          {
            emit(state.copyWith(baseState: BaseSuccessState()));
          }
        case ApiErrorResult<ResetPasswordResponseEntity>():
          {
            emit(
              state.copyWith(
                baseState: BaseErrorState(
                  errorMessage: result.errorMessage.toString(),
                ),
              ),
            );
          }
      }
    }
  }

  void _validateForm() {
    if (newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        formKey.currentState!.validate()) {
      emit(state.copyWith(isValid: true));
    } else {
      emit(state.copyWith(isValid: false));
    }
  }

  void _toggleNewPasswordVisibility() {
    emit(state.copyWith(isNewPasswordVisible: !state.isNewPasswordVisible));
  }

  void _toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible),
    );
  }
}
