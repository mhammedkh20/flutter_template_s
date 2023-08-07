import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_flutter_project/app_config.dart';
import 'package:template_flutter_project/core/services/crashlytics_service.dart';
import 'package:template_flutter_project/core/services/navigation_service.dart';
import 'package:template_flutter_project/core/services/notification_service.dart';
import 'package:template_flutter_project/core/storage/pref/shared_pref_controller.dart';
import 'package:template_flutter_project/firebase_options.dart';
import 'package:template_flutter_project/future/home/presentation/pages/main_screen.dart';
import 'package:template_flutter_project/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefController().initSharedPref();
  await NotificationService().initNotification();
  CrashlyticsService.init();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppConfig.providers,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Template',
            theme: AppConfig.themeData(),
            debugShowCheckedModeBanner: false,
            navigatorKey: locator<NavigationService>().rootNavKey,
            localizationsDelegates: AppConfig.localization(),
            supportedLocales: AppConfig.supportedLocales(),
            locale: const Locale('ar'),
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}
