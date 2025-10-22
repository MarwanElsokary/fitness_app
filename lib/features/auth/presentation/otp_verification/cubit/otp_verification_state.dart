part of 'otp_verification_cubit.dart';

class OtpVerificationState extends Equatable {
  final BaseState? baseState;
  final BaseState? resendState;
  final bool? isValid;
  final int? secondsRemaining;

  const OtpVerificationState({
    this.baseState,
    this.resendState,
    this.isValid = false,
    this.secondsRemaining = 0,
  });
  OtpVerificationState copyWith({
    BaseState? baseState,
    BaseState? resendState,
    bool? isValid,
    int? secondsRemaining,
  }) {
    return OtpVerificationState(
      baseState: baseState ?? this.baseState,
      resendState: resendState ?? this.resendState,
      isValid: isValid ?? this.isValid,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
    );
  }

  @override
  List<Object?> get props => [
    baseState,
    resendState,
    isValid,
    secondsRemaining,
  ];
}

sealed class OtpVerificationAction {}

final class OtpVerificationSendAction extends OtpVerificationAction {}

final class FormDataChangedAction extends OtpVerificationAction {}

final class OtpVerificationResendAction extends OtpVerificationAction {}
