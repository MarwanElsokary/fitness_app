import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/cubit/reset_password_cubit.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<ResetPasswordCubit>();
    return SharedBluredContainer(
      child: Form(
        key: viewModel.formKey,
        onChanged: () => viewModel.doIntent(FormDataChangedAction()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                return TextFormField(
                  controller: viewModel.newPasswordController,
                  obscureText: !state.isNewPasswordVisible,
                  validator: (value) =>
                      viewModel.validator.validatePassword(value ?? ''),
                  decoration: InputDecoration(
                    
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        state.isNewPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          viewModel.doIntent(ToggleNewPasswordVisibility()),
                    ),
                    hint: Text("Password"),
                  ),
                );
              },
            ),
            const SizedBox(height: 24.0),
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                return TextFormField(
                  controller: viewModel.confirmPasswordController,
                  obscureText: !state.isConfirmPasswordVisible,
                  validator: (value) =>
                      viewModel.validator.validateConfirmPassword(
                        value ?? '',
                        viewModel.newPasswordController.text,
                      ),
                  decoration: InputDecoration(
                    
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        state.isConfirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          viewModel.doIntent(ToggleConfirmPasswordVisibility()),
                    ),
                    hint: Text("Confirm Password"),
                  ),
                );
              },
            ),
            const SizedBox(height: 24.0),
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    viewModel.doIntent(ResetPasswordSendAction());
                  },
                   style: ElevatedButton.styleFrom(
                      backgroundColor: state.isValid == true
                          ? Colors.deepOrange
                          : Colors.grey,
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
                      : Text("Done",style: TextStyle(color: Colors.white),),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
