import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fitness_app/core/extensions/project_extensions.dart';
//import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/auth/presentation/forget_password/view/forget_password_screen.dart';
import 'package:fitness_app/features/auth/presentation/otp_verification/view/otp_verification_screen.dart';
import 'package:fitness_app/features/auth/presentation/reset_password/view/reset_password_screen.dart';
import 'package:fitness_app/features/home/presentation/pages/home.dart';
import 'package:fitness_app/features/nav_bar/nav_bar_layout.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");
    switch (url.path) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => const Home());
      case AppRoutes.navBar:
        return MaterialPageRoute(builder: (context) => NavBarLayout());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );
      case AppRoutes.otpverification:
        String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => OtpVerificationScreen(email: email),
        );
      case AppRoutes.resetPassword:
        String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(email: email),
        );
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text('404'),
                Positioned(
                  bottom: 50,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        "404 Not Found ",
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    "Oops! We couldn't find the page you're looking for.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: AppColors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                (context.height * 0.02).heightBox,
                SizedBox(
                  width: context.width * 0.6,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.homeScreen,
                      );
                    },
                    child: const Text("Go to Home"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
