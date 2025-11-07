import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ChangePasswordCustomAppBar extends StatelessWidget {
  const ChangePasswordCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 16),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                Assets.image.appLogo.path,
                height: 30,
                width: 30,
              ),
            ),
          ),
          SizedBox(width: 24),
          Text('Change password', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
