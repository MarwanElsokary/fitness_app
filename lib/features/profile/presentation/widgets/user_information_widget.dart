import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter/material.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key, required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 50,
          backgroundImage: userData.photo == null || userData.photo!.isEmpty
              ? AssetImage(Assets.icons.profileIcon)
              : NetworkImage(userData.photo!),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userData.firstName ?? '',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    userData.lastName ?? '',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
