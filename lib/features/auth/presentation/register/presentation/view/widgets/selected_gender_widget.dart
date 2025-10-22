import 'package:fitness_app/core/resources/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/register_cubit.dart';
import 'selected_gender_card_item_widget.dart';

class SelectedGenderWidget extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String> onSelectGender;
  final VoidCallback onNext;

  const SelectedGenderWidget({
    super.key,
    required this.selectedGender,
    required this.onSelectGender,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectedGenderCardItemWidget(
          text: "Male",
          isSelected: selectedGender == AppConstants.male,
          onTap: () => onSelectGender(AppConstants.male),
          iconData: Icons.male,
        ),
        const SizedBox(height: 16.0),
        SelectedGenderCardItemWidget(
          text: "Female",
          isSelected: selectedGender == AppConstants.female,
          onTap: () => onSelectGender(AppConstants.female),
          iconData: Icons.female,
        ),
        const SizedBox(height: 16.0),
        ValueListenableBuilder(
          valueListenable: viewModel.isValidate,
          builder: (context, value, child) {
            return ElevatedButton(
              onPressed: value && selectedGender != null ? onNext : null,
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty.all(
                  value && selectedGender != null
                      ? Colors.deepOrange
                      : Colors.white,
                ),
              ),
              child: Text("Next"),
            );
          },
        ),
      ],
    );
  }
}
