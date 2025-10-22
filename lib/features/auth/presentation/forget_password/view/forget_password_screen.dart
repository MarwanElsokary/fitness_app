import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/forget_password_cubit.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late final ForgetPasswordCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<ForgetPasswordCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state.baseState is BaseSuccessState) {
            // showToast(
            //   title: LocaleKeys.SuccessSendOTPToYourEmail.tr(),
            //   color: AppColors.orange,
            // );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepOrange,
                content: Text("Success Send OTP to your email"),
              ),
            );
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.otpverification,
              arguments: viewModel.emailController.text,
            );
          } else if (state.baseState is BaseErrorState) {
            // showToast(
            //   title: (state.baseState as BaseErrorState).errorMessage,
            //   color: AppColors.red,
            // );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepOrange,
                content: Text((state.baseState as BaseErrorState).errorMessage),
              ),
            );
          }
        },
        child: const Scaffold(body: ForgetPasswordForm()),
      ),
    );
  }
}
