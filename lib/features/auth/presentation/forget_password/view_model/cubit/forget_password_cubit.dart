import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/forget_password/forget_password_response_entity.dart';
import 'package:fitness_app/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final Validator validator;

  ForgetPasswordCubit(this._forgetPasswordUseCase, this.validator)
    : super(ForgetPasswordState(baseState: BaseInitialState()));

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void doIntent(ForgetPasswordAction action) {
    switch (action) {
      case ForgetPasswordSendAction():
        {
          _sendForgetPasswordEmail(action.email);
        }
      case FormDataChangedAction():
        {
          _validateEmail();
        }
    }
  }

  Future<void> _sendForgetPasswordEmail(String email) async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(baseState: BaseLoadingState()));
      final result = await _forgetPasswordUseCase(
        ForgetPasswordRequestEntity(email: email),
      );
      switch (result) {
        case ApiSuccessResult<ForgetPasswordResponseEntity>():
          {
            emit(state.copyWith(baseState: BaseSuccessState()));
          }
        case ApiErrorResult<ForgetPasswordResponseEntity>():
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

  void _validateEmail() {
    if (emailController.text.isNotEmpty && formKey.currentState!.validate()) {
      emit(state.copyWith(isValid: true));
    } else {
      emit(state.copyWith(isValid: false));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
