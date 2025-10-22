part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final BaseState? registerState;
  final int stepIndex;

  const RegisterState({this.registerState, this.stepIndex = 0});

  RegisterState copyWith({BaseState? registerState, int? stepIndex}) {
    return RegisterState(
      registerState: registerState ?? this.registerState,
      stepIndex: stepIndex ?? this.stepIndex,
    );
  }

  @override
  List<Object?> get props => [registerState, stepIndex];
}

sealed class RegisterAction {}

final class UserRegistrationAction extends RegisterAction {}

final class NextStepAction extends RegisterAction {}

final class PreviousStepAction extends RegisterAction {}

final class ChangeStepAction extends RegisterAction {
  final int stepIndex;

  ChangeStepAction(this.stepIndex);
}

final class FormDataChangedAction extends RegisterAction {}
