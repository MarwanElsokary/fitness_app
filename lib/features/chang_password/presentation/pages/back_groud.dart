import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';

class ChangePasswordBackGroundImage extends StatelessWidget {
  const ChangePasswordBackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(Assets.image.background4.path, fit: BoxFit.cover),
    );
  }
}
