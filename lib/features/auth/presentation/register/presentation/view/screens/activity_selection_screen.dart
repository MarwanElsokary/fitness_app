import 'package:fitness_app/core/utils/shared_auth_layout.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/register_cubit.dart';
import '../widgets/radio_items_widget.dart';

class ActivitySelectionScreen extends StatelessWidget {
  const ActivitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterCubit>();
    return SharedAuthLayout(
      title: "Your Regular Physical Activity Level",
      subtitle: "This Helps Us Create Your Personalized Plan",
      showIndicator: true,
      currentStep: viewModel.state.stepIndex,
      totalSteps: viewModel.pages.length - 1,
      backButtonAction: () => viewModel.doIntent(PreviousStepAction()),
      child: SharedBluredContainer(
        child: ValueListenableBuilder<String?>(
          valueListenable: viewModel.activityNotifier,
          builder: (BuildContext context, String? value, Widget? child) {
            return RadioItemsWidget(
              options: viewModel.activityLevels,
              selectedValue: value,
              onChanged: (value) => viewModel.activityNotifier.value = value,
              onSubmit: () => viewModel.doIntent(UserRegistrationAction()),
              buttonLabel: "Register",
              buttonColor: value != null ? Colors.deepOrange : Colors.white,
            );
          },
        ),
      ),
    );
  }
}
