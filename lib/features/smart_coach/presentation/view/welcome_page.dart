import 'package:fitness_app/features/smart_coach/presentation/view/chat_screen.dart';
import 'package:fitness_app/features/smart_coach/presentation/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/core/theme/app_assets.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_styles.dart';
import '../../../../core/utils/shared_blured_container.dart';
import '../../../../core/utils/components/custom_button.dart';
import 'package:fitness_app/core/extensions/project_extensions.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _translateAnimation = Tween<double>(
      begin: 0,
      end: -16,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      title: 'I am your smart coach',
      body: _buildBody(),
      endDrawer: Drawer(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            12.heightBox,
            _animatedRobotImage(),
            SharedBluredContainer(
              child: Column(
                children: [
                  const Text(
                    "How Can I Assist You \nToday?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  6.heightBox,
                  CustomButton(
                    size: const Size(double.infinity, 46),
                    backgroundColorButton: AppColors.orange,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ChatScreen()),
                      );
                    },
                    borderRadius: 100,
                    child: Text("Get Started", style: AppStyles.w80014white),
                  ),
                ],
              ),
            ),
            90.heightBox,
          ],
        ),
      ),
    );
  }

  Widget _animatedRobotImage() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _translateAnimation.value),
          child: Transform.scale(scale: _scaleAnimation.value, child: child),
        );
      },
      child: Image.asset(AppAssets.ai, width: 343.w, height: 428.h),
    );
  }
}
