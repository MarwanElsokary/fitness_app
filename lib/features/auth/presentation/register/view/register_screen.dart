import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final viewModel = getIt<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.registerState is BaseLoadingState) {
            SizedBox(
              width: 10,
              height: 10,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }
          if (state.registerState is BaseSuccessState) {
            Center(child: CircularProgressIndicator.adaptive());
            Navigator.pushReplacementNamed(context, AppRoutes.navBar);
          }
          if (state.registerState is BaseErrorState) {
            Center(child: CircularProgressIndicator.adaptive());
            // AppDialogs.showFailureDialog(
            //   context,
            //   message: (state.registerState as BaseErrorState).errorMessage,
            // );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepOrange,
                content: Text(
                  (state.registerState as BaseErrorState).errorMessage,
                ),
              ),
            );
          }
        },
        child: Scaffold(
          body: PageView.builder(
            controller: viewModel.pageController,
            onPageChanged: (index) =>
                viewModel.doIntent(ChangeStepAction(index)),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: viewModel.pages.length,
            itemBuilder: (_, i) => viewModel.pages[i],
          ),
        ),
      ),
    );
  }
}
