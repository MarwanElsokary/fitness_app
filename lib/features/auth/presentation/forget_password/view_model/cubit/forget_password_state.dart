part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  final BaseState? baseState;
  final bool? isValid;

  const ForgetPasswordState({this.baseState, this.isValid});

  ForgetPasswordState copyWith({BaseState? baseState, bool? isValid}) {
    return ForgetPasswordState(
      baseState: baseState ?? this.baseState,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [baseState, isValid];
}

sealed class ForgetPasswordAction {}

final class ForgetPasswordSendAction extends ForgetPasswordAction {
  final String email;

  ForgetPasswordSendAction(this.email);
}

final class FormDataChangedAction extends ForgetPasswordAction {}
