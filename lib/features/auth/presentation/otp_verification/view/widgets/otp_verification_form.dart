import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../cubit/otp_verification_cubit.dart';
import 'resend_otp_verification.dart';

class OtpVerificationForm extends StatelessWidget {
  const OtpVerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<OtpVerificationCubit>();
    return SharedBluredContainer(
      child: Form(
        key: viewModel.formKey,
        onChanged: () => viewModel.doIntent(FormDataChangedAction()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PinCodeTextField(
              length: 6,
              controller: viewModel.otpController,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              autoFocus: true,
              textStyle: const TextStyle(
                color: Colors.deepOrange,
                fontSize: 16,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                activeColor: Colors.deepOrange,
                inactiveColor: Colors.white,
                selectedColor: Colors.deepOrange,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: false,
              appContext: context,
            ),
            const SizedBox(height: 24.0),
            BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
              buildWhen: (previous, current) =>
                  previous.baseState != current.baseState,
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    viewModel.doIntent(OtpVerificationSendAction());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: state.isValid == true
                          ? Colors.deepOrange
                          : Colors.grey,
                    ),
                  child: state.baseState is BaseLoadingState
                      ? const SizedBox(
                          width: 10,
                          height: 10,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Text("Verify",style: TextStyle(color: Colors.white),),
                );
              },
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Didn't receive the code?",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 4.0),
            const ResendOtpVerification(),
          ],
        ),
      ),
    );
  }
}
