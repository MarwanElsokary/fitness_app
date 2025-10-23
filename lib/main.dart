import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/l10n/app_localizations.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/modules/shared_preferences_module.dart';
import 'core/route/routes.dart';
import 'core/utils/caching/caching_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await CacheService.cacheInitialization();

  final sharedPref = getIt<SharedPrefHelper>();

  final seenOnboarding = sharedPref.getValue('seenOnboarding');
  final isSeen = (seenOnboarding is bool) ? seenOnboarding : false;

  runApp(MyApp(seenOnboarding: isSeen));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenOnboarding});

  final bool seenOnboarding;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fitness App",
        theme: ThemeData.dark(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: AppRoutes.onBoardingScreen,

        // seenOnboarding
        //     ? AppRoutes.loginView
        //     : AppRoutes.onBoardingScreen,
      ),
    );
  }
}
