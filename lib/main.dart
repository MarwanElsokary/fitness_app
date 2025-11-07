import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/keys/shared_key.dart';
import 'package:fitness_app/core/l10n/app_localizations.dart';
import 'package:fitness_app/core/resources/app_constants.dart';
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
  final sharedPrefHelper = getIt<SharedPrefHelper>();
  await sharedPrefHelper.setValue(
    SharedPrefKeys.apiKey,
    "AIzaSyDYTakQnOUBp6jGKEi2D_mgXh6tfDzp9hU",
  );

  final seenOnboarding = sharedPref.getValue('seenOnboarding');
  final isSeen = (seenOnboarding is bool) ? seenOnboarding : false;
  final token = sharedPref.getValue(AppConstants.tokenKey);
  runApp(MyApp(seenOnboarding: isSeen, token: token));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenOnboarding, this.token});

  final bool seenOnboarding;
  final String? token;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Fitness App",
            theme: ThemeData.dark(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            onGenerateRoute: Routes.generateRoute,
            initialRoute: token != null ? AppRoutes.navBar : AppRoutes
                .loginView,
          ),
    );
  }
}
