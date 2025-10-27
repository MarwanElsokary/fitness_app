import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/features/home/presentation/view/home_screen.dart';
import 'package:fitness_app/features/chat_with_ai/presentation/pages/chat_ai_page.dart';
import 'package:fitness_app/features/gym/presentation/pages/gym_page.dart';
import 'package:fitness_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarLayout extends StatefulWidget {
  const NavBarLayout({super.key});

  @override
  State<NavBarLayout> createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = const [HomeScreen(), ChatAiPage(), GymPage(), ProfilePage()];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildFloatingNavBar() {
    return Container(
      margin: EdgeInsets.all(32.w),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      height: 80.h,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.grey[900]?.withOpacity(0.95),
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 10.r),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavIcon(Assets.icons.home.path, 0),
          _buildNavIcon(Assets.icons.chatAi.path, 1),
          _buildNavIcon(Assets.icons.gym.path, 2),
          _buildNavIcon(Assets.icons.profile.path, 3),
        ],
      ),
    );
  }

  Widget _buildNavIcon(String path, int index) {
    final isSelected = _selectedIndex == index;
    final List<String> labels = ["Explore", "Chat AI", "Gym", "Profile"];

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  path,
                  width: 28.w,
                  height: 28.h,
                  color: isSelected ? Colors.deepOrange : Colors.white,
                ),
                SizedBox(height: 4.h),
                if (isSelected)
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Colors.grey[900]?.withOpacity(0.70),
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildFloatingNavBar(),
          ),
        ],
      ),
    );
  }
}
