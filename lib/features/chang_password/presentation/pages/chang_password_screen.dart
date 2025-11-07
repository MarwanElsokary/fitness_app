import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/modules/shared_preferences_module.dart';
import 'package:fitness_app/core/resources/app_constants.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:fitness_app/features/chang_password/presentation/cubit/chang_password_cubit.dart';
import 'package:fitness_app/features/chang_password/presentation/cubit/chang_password_state.dart';
import 'package:fitness_app/features/chang_password/presentation/pages/app_bar_custom.dart';
import 'package:fitness_app/features/chang_password/presentation/pages/back_groud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<ChangePasswordViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: Stack(
        children: [
          ChangePasswordBackGroundImage(),

          SingleChildScrollView(
            child: Column(
              children: [
                ChangePasswordCustomAppBar(),
                SizedBox(height: 16.h),
                Column(
                  children: [
                    SharedBluredContainer(
                      child: BlocConsumer<ChangePasswordViewModel, ChangePasswordState>(
                        listener: (context, state) {
                          if (state is ChangePasswordErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errorMessage)),
                            );
                          }
                          if (state is ChangePasswordSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Password changed successfully'),
                              ),
                            );
                            final sharedPref = getIt<SharedPrefHelper>();
                            sharedPref.removePreference(
                              key: AppConstants.tokenKey,
                            );
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.loginView,
                              (route) => false,
                            );
                          }
                          if (state is ChangePasswordLoadingState) {
                            Center(child: CircularProgressIndicator());
                          }
                        },
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Form(
                              key: viewModel.formKey,
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  TextFormField(
                                    key: const Key('passwordField'),

                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your current password';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    },
                                    obscuringCharacter: '*',
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    controller:
                                        viewModel.currentPasswordController,
                                    // style: AppTextStyles.BalooThambi2_500_16.copyWith(
                                    //   color: AppColors.whiteColor,
                                    // ),
                                    decoration: InputDecoration(
                                      hintText: "Current password",

                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                  TextFormField(
                                    obscuringCharacter: "*",
                                    obscureText: true,
                                    controller: viewModel.newPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your current password';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "New password",
                                    ),
                                    // style: AppTextStyles.BalooThambi2_500_16.copyWith(
                                    //   color: AppColors.whiteColor,
                                    // ),
                                  ),
                                  SizedBox(height: 24),
                                  TextFormField(
                                    obscuringCharacter: "*",
                                    obscureText: true,
                                    // style: AppTextStyles.BalooThambi2_500_16.copyWith(
                                    //   color: AppColors.whiteColor,
                                    // ),
                                    validator:
                                        viewModel.confirmPasswordValidator,
                                    controller:
                                        viewModel.confirmPasswordController,
                                    decoration: InputDecoration(
                                      hintText: "Confirm password",
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      // var token = sharedPref.getValue(
                                      //   AppConstants.tokenKey,
                                      // );
                                      // if (token != null || token != '') {
                                      //   token = null;
                                      // }

                                      if (BlocProvider.of<
                                            ChangePasswordViewModel
                                          >(context)
                                          .formKey
                                          .currentState!
                                          .validate()) {
                                        viewModel.doIntent(
                                          ClickedChangePasswordIntent(),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "update",
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
