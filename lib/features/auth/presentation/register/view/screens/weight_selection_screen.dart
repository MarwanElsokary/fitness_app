import 'package:fitness_app/core/utils/shared_auth_layout.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/register_cubit.dart';
import '../widgets/wheel_slider_selector.dart';

class WeightSelectionScreen extends StatelessWidget {
  const WeightSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterCubit>();
    return SharedAuthLayout(
      title: "What Is Your Weight",
      subtitle: "This Helps Us Create Your Personalized Plan",
      showIndicator: true,
      currentStep: viewModel.state.stepIndex,
      totalSteps: viewModel.pages.length - 1,
      backButtonAction: () => viewModel.doIntent(PreviousStepAction()),
      child: SharedBluredContainer(
        child: ValueListenableBuilder<int?>(
          valueListenable: viewModel.weightNotifier,
          builder: (BuildContext context, int? value, Widget? child) {
            return WheelSliderSelector(
              label: "Kg",
              initialValue: value ?? 70,
              onValueChanged: (value) => viewModel.weightNotifier.value = value,
              buttonText: "Next",
              buttonColor: value != null ? Colors.deepOrange : Colors.white,
              onButtonPressed: () => viewModel.doIntent(NextStepAction()),
            );
          },
        ),
      ),
    );
  }
}
