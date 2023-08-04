import 'package:get/get.dart';

import 'ui/MainScreen/main_binding.dart';
import 'ui/MainScreen/main_screen.dart';
import 'ui/SplashScreen/splash_binding.dart';
import 'ui/SplashScreen/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: '/',
        page: () => SplashScreen(),
        binding: SplashBinding()
    ),
    GetPage(
        name: '/main',
        page: () => MainScreen(),
        binding: MainBinding()
    ),
  ];
}