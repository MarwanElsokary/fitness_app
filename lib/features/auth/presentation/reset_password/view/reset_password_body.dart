import 'package:fitness_app/core/utils/shared_auth_layout.dart';
import 'package:flutter/material.dart';
import 'reset_password_form.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedAuthLayout(
      title: "Make sure it's 8 or more characters",
      subtitle: "create a new password",
      reverseOrder: true,
      child: const ResetPasswordForm(),
    );
  }
}
