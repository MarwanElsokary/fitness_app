import 'package:fitness_app/core/gen/assets.gen.dart';
import 'package:fitness_app/core/utils/circular_indicator_widget.dart';
import 'package:flutter/material.dart';

class SharedAuthLayout extends StatelessWidget {
  const SharedAuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.reverseOrder = false,
    this.setBackButton = true,
    this.showIndicator = false,
    this.backButtonAction,
    this.currentStep,
    this.totalSteps,
  });

  final String title;
  final String subtitle;
  final Widget? child;
  final bool? reverseOrder;
  final bool? setBackButton;
  final VoidCallback? backButtonAction;
  final bool showIndicator;
  final int? currentStep;
  final int? totalSteps;

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.image.background2.path),
          fit: BoxFit.cover,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50.0),
                  Row(
                    children: [
                      setBackButton == true
                          ? CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              radius: 14,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  size: 28,
                                  Icons.arrow_left_rounded,
                                  color: Colors.white,
                                ),
                                onPressed:
                                    backButtonAction ??
                                    () {
                                      Navigator.of(context).pop();
                                    },
                              ),
                            )
                          : const SizedBox.shrink(),
                      const Spacer(),
                      Image.asset(Assets.image.appLogo.path, height: 65.0),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 60.0),
                  if (showIndicator &&
                      currentStep != null &&
                      totalSteps != null) ...[
                    Align(
                      alignment: Alignment.center,
                      child: CircularIndicatorWidget(
                        current: currentStep!,
                        total: totalSteps!,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (reverseOrder!)
                    _buildSubtitle(context)
                  else
                    _buildTitle(context),
                  if (reverseOrder!)
                    _buildTitle(context)
                  else
                    _buildSubtitle(context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          if (child != null) SliverToBoxAdapter(child: child!),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
      ),
    );
  }
}
