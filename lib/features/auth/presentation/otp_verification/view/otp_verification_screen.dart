import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/otp_verification_cubit.dart';
import 'widgets/otp_verification_body.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late final OtpVerificationCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<OtpVerificationCubit>();
    viewModel.email.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<OtpVerificationCubit, OtpVerificationState>(
        listener: (context, state) {
          if (state.baseState is BaseSuccessState) {
            // showToast(
            //   title: LocaleKeys.OtpVerificationSuccessfully.tr(),
            //   color: AppColors.orange,
            // );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepOrange,
                content: Text("Otp Verification Successfully"),
              ),
            );
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.resetPassword,
              arguments: widget.email,
            );
          }
          if (state.baseState is BaseErrorState) {
            // showToast(
            //   title: (state.baseState as BaseErrorState).errorMessage,
            //   color: AppColors.red,
            // );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepOrange,
                content: Text("Otp Verification Successfully"),
              ),
            );
          }
        },
        child: const Scaffold(body: OtpVerificationBody()),
      ),
    );
  }
}
