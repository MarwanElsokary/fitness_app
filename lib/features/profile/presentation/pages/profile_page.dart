import 'package:fitness_app/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('change password'),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.changPassword);
        },
      ),
    );
  }
}
