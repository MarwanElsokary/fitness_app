part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final BaseState? baseState;
  final bool? isValid;
  final bool isNewPasswordVisible;
  final bool isConfirmPasswordVisible;

  const ResetPasswordState({
    this.baseState,
    this.isValid = false,
    this.isNewPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });

  ResetPasswordState copyWith({
    BaseState? baseState,
    bool? isValid,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return ResetPasswordState(
      baseState: baseState ?? this.baseState,
      isValid: isValid ?? this.isValid,
      isNewPasswordVisible: isNewPasswordVisible ?? this.isNewPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
    baseState,
    isValid,
    isNewPasswordVisible,
    isConfirmPasswordVisible,
  ];
}

sealed class ResetPasswordAction {}

final class ResetPasswordSendAction extends ResetPasswordAction {}

final class FormDataChangedAction extends ResetPasswordAction {}

final class ToggleNewPasswordVisibility extends ResetPasswordAction {}

final class ToggleConfirmPasswordVisibility extends ResetPasswordAction {}
