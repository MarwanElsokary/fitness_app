import 'package:fitness_app/core/utils/shared_auth_layout.dart';
import 'package:flutter/material.dart';

import 'otp_verification_form.dart';

class OtpVerificationBody extends StatelessWidget {
  const OtpVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedAuthLayout(
      title: "OTP Verification",
      subtitle: "Enter the OTP sent to your email",
      child: const OtpVerificationForm(),
    );
  }
}
