import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/utils/shared_auth_layout.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/forget_password_cubit.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<ForgetPasswordCubit>();
    return SharedAuthLayout(
      title: "Forget Password",
      subtitle: "Enter your email to reset your password",
      reverseOrder: true,
      child: SharedBluredContainer(
        child: Form(
          key: viewModel.formKey,
          onChanged: () => viewModel.doIntent(FormDataChangedAction()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: viewModel.emailController,
                validator: (value) =>
                    viewModel.validator.validateEmail(value ?? ''),
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24.0),
              BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (state.isValid == true) {
                        viewModel.doIntent(
                          ForgetPasswordSendAction(
                            viewModel.emailController.text,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: state.isValid == true
                          ? Colors.deepOrange
                          : Colors.white,
                    ),
                    child: state.baseState is BaseLoadingState
                        ? const SizedBox(
                            width: 10,
                            height: 10,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text("Send OTP"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
