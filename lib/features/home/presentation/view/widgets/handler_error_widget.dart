import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HandlerErrorWidget extends StatelessWidget {
  const HandlerErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          const Icon(Icons.error, color: Colors.red, size: 50),

          const SizedBox(height: 8.0),
          Text(
            "Something Went Wrong Please Try Again Later",
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
