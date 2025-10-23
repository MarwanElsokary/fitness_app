import 'package:flutter/material.dart';

class RadioTileItem extends StatelessWidget {
  const RadioTileItem({
    super.key,
    required this.value,
    required this.selectedValue,
    required this.onSelected,
    required this.onChanged,
  });

  final void Function() onSelected;
  final String value;
  final String selectedValue;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: ShapeDecoration(
        color: Colors.grey.shade800,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onSelected,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Radio<String>(
              value: value,
              // ignore: deprecated_member_use
              groupValue: selectedValue,
              // ignore: deprecated_member_use
              onChanged: (value) {
                onChanged(value!);
              },
              fillColor: WidgetStateProperty.resolveWith(
                (states) => Colors.white,
              ),
              activeColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }
}
