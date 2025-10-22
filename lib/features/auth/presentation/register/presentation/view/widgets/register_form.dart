import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/utils/shared_auth_layout.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../view_model/cubit/register_cubit.dart';
import 'already_have_account_text.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterCubit>();
    return SharedAuthLayout(
      title: "Create an account",
      subtitle: "create a new account",
      setBackButton: false,
      reverseOrder: true,
      child: SharedBluredContainer(
        child: Form(
          onChanged: () => viewModel.doIntent(FormDataChangedAction()),
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Register",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: viewModel.firstNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return viewModel.validator.validateName(value ?? "");
                },
                decoration: InputDecoration(
                  hintText: "First Name",
                  prefixIcon: SvgPicture.asset(
                    Assets.icons.user,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: viewModel.lastNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return viewModel.validator.validateName(value ?? "");
                },
                decoration: InputDecoration(
                  hintText: "Last Name",
                  prefixIcon: SvgPicture.asset(
                    Assets.icons.user,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: viewModel.emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return viewModel.validator.validateEmail(value ?? "");
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder(
                valueListenable: viewModel.isPasswordVisible,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: viewModel.passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return viewModel.validator.validatePassword(value ?? "");
                    },
                    obscureText: !value,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.isPasswordVisible.value =
                              !viewModel.isPasswordVisible.value;
                        },
                        icon: Icon(
                          viewModel.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder(
                valueListenable: viewModel.isValidate,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: value
                        ? () {
                            viewModel.doIntent(NextStepAction());
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: value ? Colors.deepOrange : Colors.white,
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: value ? Colors.white : Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.center,
                child: AlreadyHaveAccountText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
