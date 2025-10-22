import 'package:fitness_app/core/utils/shared_auth_layout.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/register_cubit.dart';
import '../widgets/selected_gender_widget.dart';

class GenderSelectionScreen extends StatelessWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterCubit>();
    return SharedAuthLayout(
      title: "Tell Us About Your self",
      subtitle: "We Need To Know Your Gender",
      showIndicator: true,
      currentStep: viewModel.state.stepIndex,
      totalSteps: viewModel.pages.length - 1,
      backButtonAction: () => viewModel.doIntent(PreviousStepAction()),
      child: SharedBluredContainer(
        child: ValueListenableBuilder<String?>(
          valueListenable: viewModel.genderNotifier,
          builder: (BuildContext context, String? value, Widget? child) {
            return SelectedGenderWidget(
              selectedGender: value,
              onSelectGender: (value) => viewModel.genderNotifier.value = value,
              onNext: () => viewModel.doIntent(NextStepAction()),
            );
          },
        ),
      ),
    );
  }
}
