import 'package:fitness_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback? onBack;

  final Function(String)? onSelectChat;

  const SharedScaffold({
    super.key,
    required this.title,
    required this.body,
    this.onBack,
    required Drawer endDrawer,
    this.onSelectChat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: AppColors.orange,
            radius: 18.r,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset(AppAssets.aiBack, width: 20.w, height: 20.h),
              onPressed: onBack ?? () => Navigator.of(context).pop(),
            ),
          ),
        ),
        title: Text(title, style: AppStyles.medium16white),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Image.asset(AppAssets.drawerIcon, color: AppColors.orange),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),

      endDrawer: Drawer(
        shadowColor: AppColors.black,
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.transparent,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Previous conversations',
                style: AppStyles.bold20white,
              ),
            ),
            ...[
              "Hello!",
              "Lorem ipsum dolor sit amet",
              "Lorem ipsum dolor sit amet",
            ].map((chat) {
              return ListTile(
                title: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: AppColors.orange),
                    Spacer(),
                    Text(
                      chat,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.font13WhiteW500,
                    ),
                  ],
                ),
                onTap: () {
                  if (onSelectChat != null) {
                    onSelectChat!(chat);
                  }
                  Navigator.of(context).pop();
                },
              );
            }),
          ],
        ),
      ),

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppAssets.aiBg, fit: BoxFit.cover),
          SafeArea(child: body),
        ],
      ),
    );
  }
}
