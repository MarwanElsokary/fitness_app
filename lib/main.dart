import 'package:fitness_app/core/di/di.dart';
// import 'package:fitness_app/core/extensions/project_extensions.dart';
// import 'package:fitness_app/core/l10n/app_localizations.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/route/routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/caching/caching_helper.dart';
// import 'core/utils/language_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await CacheService.cacheInitialization();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});

  final String? token;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fitness App",
        theme: AppTheme.lightTheme,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: AppRoutes.homeScreen,
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key, this.token});

//   final String? token;

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 813),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) => BlocProvider(
//         create: (context) => getIt<LocaleCubit>(),
//         child: BlocBuilder<LocaleCubit, Locale>(
//           builder: (context, locale) {
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: context.l10n.appName,
//               localizationsDelegates: AppLocalizations.localizationsDelegates,
//               supportedLocales: AppLocalizations.supportedLocales,
//               locale: locale,
//               theme: AppTheme.lightTheme,
//               onGenerateRoute: Routes.generateRoute,
//               initialRoute: AppRoutes.homeScreen,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
