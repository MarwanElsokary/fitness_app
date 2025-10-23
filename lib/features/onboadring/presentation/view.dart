import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/extensions/project_extensions.dart';
import 'package:fitness_app/core/modules/shared_preferences_module.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:fitness_app/core/theme/app_assets.dart';
import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  late final List<Map<String, String>> onboardingData = [
    {
      "image": AppAssets.onBoardingImage1,
      "title": context.l10n.title1oOnBarding,
      "subtitle": context.l10n.subtitle1OnBarding,
    },
    {
      "image": AppAssets.onBoardingImage2,
      "title": context.l10n.title2oOnBarding,
      "subtitle": context.l10n.subtitle2OnBarding,
    },
    {
      "image": AppAssets.onBoardingImage3,
      "title": context.l10n.title3oOnBarding,
      "subtitle": context.l10n.subtitle3OnBarding,
    },
  ];

  void nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onBoardingBackGround),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // PageView content
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Image.asset(
                        onboardingData[index]["image"]!,
                        height: 596,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 275.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(36, 36, 36, 0.8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 30,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(
                                  onboardingData[index]["title"]!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  onboardingData[index]["subtitle"]!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                onboardingData.length,
                                (dotIndex) => Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  height: 8,
                                  width: _currentPage == dotIndex ? 20 : 8,
                                  decoration: BoxDecoration(
                                    color: _currentPage == dotIndex
                                        ? AppColors.orange
                                        : AppColors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            if (_currentPage == 0)
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    minimumSize: const Size(
                                      double.infinity,
                                      50,
                                    ),
                                  ),
                                  onPressed: () async {
                                    final sharedPref =
                                        getIt<SharedPrefHelper>();
                                    await sharedPref.setValue(
                                      'seenOnboarding',
                                      true,
                                    );
                                    nextPage();
                                  },
                                  child: Text(
                                    context.l10n.next,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            else
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      side: const BorderSide(
                                        color: AppColors.white,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      minimumSize: const Size(90, 45),
                                    ),
                                    onPressed: previousPage,
                                    child: Text(
                                      context.l10n.back,
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      minimumSize: const Size(90, 45),
                                    ),
                                    onPressed: () async {
                                      final sharedPref =
                                          getIt<SharedPrefHelper>();
                                      await sharedPref.setValue(
                                        'seenOnboarding',
                                        true,
                                      );
                                      if (_currentPage ==
                                          onboardingData.length - 1) {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          AppRoutes.loginView,
                                        );
                                      } else {
                                        nextPage();
                                      }
                                    },
                                    child: Text(
                                      _currentPage == onboardingData.length - 1
                                          ? context.l10n.doIt
                                          : context.l10n.next,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Skip button
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () async {
                final sharedPref = getIt<SharedPrefHelper>();
                await sharedPref.setValue('seenOnboarding', true);

                Navigator.pushReplacementNamed(context, AppRoutes.loginView);
              },

              child: Text(
                context.l10n.skip,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
