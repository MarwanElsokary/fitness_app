import 'package:fitness_app/core/di/di.dart';
import 'package:fitness_app/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/route/routes.dart';
import 'core/utils/caching/caching_helper.dart';

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
        theme: ThemeData.dark(),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: AppRoutes.forgetPassword,
      ),
    );
  }
}
