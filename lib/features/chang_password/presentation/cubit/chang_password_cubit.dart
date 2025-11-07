import 'package:fitness_app/core/api_layer/api_result/api_result.dart';
import 'package:fitness_app/features/chang_password/data/models/chang_password_request.dart';
import 'package:fitness_app/features/chang_password/domain/entities/change_password_entity.dart';
import 'package:fitness_app/features/chang_password/domain/usecases/chang_password_use_case.dart';
import 'package:fitness_app/features/chang_password/presentation/cubit/chang_password_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  ChangePasswordViewModel(this._changePasswordUseCase)
    : super(ChangePasswordLoadingState());
  final ChangePasswordUseCase _changePasswordUseCase;
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void doIntent(ChangePasswordIntent intent) {
    switch (intent) {
      case ClickedChangePasswordIntent():
        _changePassword();
        break;
    }
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password ';
    }
    if (value != newPasswordController.text) {
      return 'Password do not match ';
    }
    return null;
  }

  Future<void> _changePassword() async {
    emit(ChangePasswordLoadingState());
    final result = await _changePasswordUseCase.execute(
      ChangePasswordRequestModel(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      ),
    );
    switch (result) {
      case ApiSuccessResult<ChangePasswordEntity>():
        var data = result.data;
        if (data.message == "success") {
          emit(ChangePasswordSuccessState());
        } else {
          emit(ChangePasswordErrorState(data.error.toString()));
        }
        break;
      case ApiErrorResult<ChangePasswordEntity>():
        emit(ChangePasswordErrorState(result.errorMessage.toString()));
        break;
    }
  }
}

sealed class ChangePasswordIntent {}

class ClickedChangePasswordIntent extends ChangePasswordIntent {}
