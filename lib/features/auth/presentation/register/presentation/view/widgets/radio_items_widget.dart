import 'package:flutter/material.dart';

import 'radio_tile_item.dart';

class RadioItemsWidget extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmit;
  final String buttonLabel;
  final Color buttonColor;

  const RadioItemsWidget({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    required this.onSubmit,
    required this.buttonLabel,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...options.map(
          (option) => RadioTileItem(
            value: option,
            selectedValue: selectedValue ?? '',
            onSelected: () => onChanged(option),
            onChanged: onChanged,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
          onPressed: selectedValue != null ? onSubmit : null,
          child: Text(buttonLabel,style: TextStyle(
            color: buttonColor == Colors.white ? Colors.deepOrange : Colors.white
          ),),
        ),
      ],
    );
  }
}
