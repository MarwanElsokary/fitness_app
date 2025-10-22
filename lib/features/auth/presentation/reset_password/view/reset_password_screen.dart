import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/reset_password_cubit.dart';
import 'reset_password_body.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final ResetPasswordCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<ResetPasswordCubit>();
    viewModel.emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state.baseState is BaseSuccessState) {
            // showToast(
            //   title: LocaleKeys.ResetPasswordSuccessfully.tr(),
            //   color: AppColors.orange,
            // );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepOrange,
                content: Text("Reset Password Successfully"),
              ),
            );
            // Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
          }
          if (state.baseState is BaseErrorState) {
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
        child: const Scaffold(body: ResetPasswordBody()),
      ),
    );
  }
}
