import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Already have an account?",
        style: const TextStyle(color: Colors.white),
        children: [
          TextSpan(
            text: "Login",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            style: const TextStyle(
              color: Colors.deepOrange,
              decoration: TextDecoration.underline,
              decorationColor: Colors.deepOrange,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
