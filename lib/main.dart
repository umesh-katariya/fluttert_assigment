import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_pages.dart';
import 'fcm_service.dart';
import 'utils/app_colors.dart';
import 'utils/constants.dart';
import 'utils/lang_directory/translation_service.dart';
import 'utils/pref_util.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await initializeFireBase();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await PreferenceUtils.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    final screenWidth = queryData.size.width;

    return ScreenUtilInit(
      // designSize: const Size(375, 812),
      /*designSize:
            screenWidth <= 430 ? const Size(375, 812)  : const Size(696, 895),*/
        designSize:
        screenWidth <= 430 ? const Size(375, 812)  : const Size(610, 970),
        builder: (c, child) => GetMaterialApp(
          title: Constants.appLabelName,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
              primarySwatch: AppColors.primaryMaterialColor,
              scaffoldBackgroundColor: AppColors.backgroundColor,
              fontFamily: 'Lato'),
          initialRoute: '/',
          getPages: AppPages.routes,
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
        ));
  }
}