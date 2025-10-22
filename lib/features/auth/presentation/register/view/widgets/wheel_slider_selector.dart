import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class WheelSliderSelector extends StatelessWidget {
  final String label;
  final int initialValue;
  final Function(dynamic) onValueChanged;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onButtonPressed;
  final int totalCount;

  const WheelSliderSelector({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onValueChanged,
    required this.buttonText,
    required this.buttonColor,
    required this.onButtonPressed,
    this.totalCount = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 62,
          width: double.infinity,
          child: WheelSlider.number(
            totalCount: totalCount,
            initValue: initialValue,
            unSelectedNumberStyle: TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
            selectedNumberStyle: TextStyle(
              fontSize: 44.0,
              color: Colors.deepOrange,
              fontWeight: FontWeight.w800,
            ),
            currentIndex: initialValue,
            onValueChanged: onValueChanged,
            itemSize: 100,
            isInfinite: true,
            listHeight: 800,
            listWidth: 400,
            animationDuration: const Duration(milliseconds: 300),
            animationType: Curves.easeInOut,
            customPointer: const SizedBox(),
            horizontal: true,
            scrollPhysics: const BouncingScrollPhysics(),
            showPointer: true,
            verticalListHeight: 300,
            horizontalListHeight: 100,
            horizontalListWidth: 200,
            verticalListWidth: 100,
            hapticFeedbackType: HapticFeedbackType.selectionClick,
          ),
        ),
        const SizedBox(height: 8),
        Icon(Icons.arrow_drop_up, size: 30, color: Colors.deepOrange),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
          child: Text(buttonText,style: const TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}
