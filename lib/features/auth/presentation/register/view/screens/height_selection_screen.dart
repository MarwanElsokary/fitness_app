import 'dart:developer';
import 'package:fitness_app/core/utils/shared_auth_layout.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/register_cubit.dart';
import '../widgets/wheel_slider_selector.dart';

class HeightSelectionScreen extends StatelessWidget {
  const HeightSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterCubit>();
    log("What Is Your Height");
    return SharedAuthLayout(
      title: "What Is Your Height",
      subtitle: "This Helps Us Create Your Personalized Plan",
      showIndicator: true,
      currentStep: viewModel.state.stepIndex,
      totalSteps: viewModel.pages.length - 1,
      backButtonAction: () => viewModel.doIntent(PreviousStepAction()),
      child: SharedBluredContainer(
        child: ValueListenableBuilder<int?>(
          valueListenable: viewModel.heightNotifier,
          builder: (BuildContext context, int? value, Widget? child) {
            return WheelSliderSelector(
              label: "Cm",
              initialValue: value ?? 170,
              onValueChanged: (value) => viewModel.heightNotifier.value = value,
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
