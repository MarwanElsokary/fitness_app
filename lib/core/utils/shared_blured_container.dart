import 'dart:ui';

import 'package:flutter/material.dart';

class SharedBluredContainer extends StatelessWidget {
  const SharedBluredContainer({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: AnimatedContainer(
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
          color: Colors.grey.shade800.withAlpha(150),
          duration: const Duration(milliseconds: 3000),
          child: child,
        ),
      ),
    );
  }
}
