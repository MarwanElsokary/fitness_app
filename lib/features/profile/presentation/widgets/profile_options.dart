import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/core/utils/shared_blured_container.dart';
import 'package:fitness_app/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter/material.dart';

class ProfileOptionsSection extends StatelessWidget {
  const ProfileOptionsSection({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SharedBluredContainer(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTileCustom(
              onTap: () {},
              icon: Icons.person,
              title: 'Edit Profile',
            ),
            ListTileCustom(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.changPassword);
              },
              icon: Icons.lock,
              title: 'Change Password',
            ),
            ListTile(
              title: Text(
                'Select lang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Icon(Icons.language, color: Colors.deepOrange),
              trailing: Switch.adaptive(
                value: true,
                onChanged: (value) {
                  value = !value;
                },
                //  activeThumbColor: Colors.deepOrange,
                // ignore: deprecated_member_use
                activeColor: Colors.deepOrange,
              ),
            ),
            ListTileCustom(
              onTap: () {},
              icon: Icons.security,
              title: 'Security',
            ),
            ListTileCustom(
              onTap: () {},
              icon: Icons.privacy_tip,
              title: "Privacy Policy",
            ),
            ListTileCustom(onTap: () {}, icon: Icons.help, title: "Help"),
            ListTileCustom(onTap: () {}, icon: Icons.logout, title: 'Logout'),
          ],
        ),
      ),
    );
  }
}

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.deepOrange),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepOrange),
    );
  }
}
