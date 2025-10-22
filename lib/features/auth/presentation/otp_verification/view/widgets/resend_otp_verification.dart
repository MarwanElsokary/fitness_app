import 'package:fitness_app/core/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/otp_verification_cubit.dart';

class ResendOtpVerification extends StatelessWidget {
  const ResendOtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpVerificationCubit, OtpVerificationState>(
      buildWhen: (previous, current) =>
          previous.secondsRemaining != current.secondsRemaining ||
          previous.resendState != current.resendState,
      listener: (context, state) {
        if (state.resendState is BaseErrorState) {
          // showToast(
          //   title: (state.resendState as BaseErrorState).errorMessage,
          //   color: AppColors.red,
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text((state.resendState as BaseErrorState).errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.secondsRemaining! > 0) {
          return Align(
            alignment: Alignment.center,
            child: Text(
              '${"Resend code in"} ${state.secondsRemaining}s',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
        return TextButton(
          onPressed: () {
            context.read<OtpVerificationCubit>().doIntent(
              OtpVerificationResendAction(),
            );
          },
          child: state.resendState is BaseLoadingState
              ? const SizedBox(
                  height: 10,
                  width: 10,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )
              : Text(
                  "Resend Code",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.deepOrange,
                    decorationThickness: 1.5,
                  ),
                ),
        );
      },
    );
  }
}
