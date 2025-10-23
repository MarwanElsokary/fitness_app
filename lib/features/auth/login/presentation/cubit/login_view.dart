import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/dialog/dialog.dart';
import 'package:fitness_app/core/extensions/project_extensions.dart';
import 'package:fitness_app/core/extensions/validation_ext.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_styles.dart';
import 'package:fitness_app/core/utils/components/app_text_form_feild.dart';
import 'package:fitness_app/core/utils/components/custom_button.dart';
import 'package:fitness_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:fitness_app/features/auth/login/presentation/cubit/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: BlocConsumer<LoginViewModel, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: state.message,
              posActions: context.l10n.ok,
            );
          } else if (state is LoginLoadingState) {
            DialogUtils.showLoading(
              context: context,
              loadingMessage: context.l10n.loading,
            );
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: context.l10n.success,
              posActions: context.l10n.ok,
              posFunction: (context) {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(
                  context,
                ).pushReplacementNamed(AppRoutes.homeScreen);
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/image/auth_background.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: context.read<LoginViewModel>().formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          80.heightBox,
                          Image.asset(
                            "assets/image/Frame 6.png",
                            width: 120.w,
                            height: 98.h,
                          ),
                          Text(
                            context.l10n.hetThere,
                            style: AppStyles.medium18whiteW400,
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            context.l10n.welcomBack,
                            style: AppStyles.bold20white,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            context.l10n.login,
                            style: AppStyles.bold24white,
                            textAlign: TextAlign.center,
                          ),
                          14.heightBox,
                          AppTextFormField(
                            prefIcon: Icon(Icons.email_outlined),

                            hintText: context.l10n.enterYourEmail,
                            labelText: context.l10n.email,
                            isPassword: false,
                            validator: (value) => value.validateEmail(context),
                            controller: context
                                .read<LoginViewModel>()
                                .emailController,
                          ),
                          24.heightBox,
                          AppTextFormField(
                            prefIcon: Icon(Icons.lock_open),
                            isPassword: true,
                            hintText: context.l10n.enterYourNewPassword,
                            labelText: context.l10n.password,
                            validator: (value) =>
                                value.validatePassword(context),
                            suffixIcon: const Icon(Icons.visibility_off),
                            controller: context
                                .read<LoginViewModel>()
                                .passwordController,
                          ),
                          11.heightBox,

                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.forgetPassword,
                              );
                            },
                            child: Text(
                              textAlign: TextAlign.end,
                              "${context.l10n.forgetPassword}?",
                              style: const TextStyle(
                                color: AppColors.orange,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          22.heightBox,
                          CustomButton(
                            backgroundColorButton: AppColors.orange,
                            onPressed: () {
                              if (context
                                  .read<LoginViewModel>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                context.read<LoginViewModel>().login();
                              }
                            },
                            borderRadius: 100,
                            child: Text(
                              context.l10n.login,
                              style: AppStyles.w80014white,
                            ),
                          ),
                          8.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.l10n.dontHaveAnAccountYet,
                                textAlign: TextAlign.center,
                                style: AppStyles.font13WhiteW500,
                              ),
                              GestureDetector(
                                // onTap: () {
                                //   Navigator.pushNamed(
                                //     context,
                                //     AppRoutes.register,
                                //   );
                                // },
                                child: Text(
                                  textAlign: TextAlign.end,
                                  context.l10n.register,
                                  style: AppStyles.w80014orange,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
