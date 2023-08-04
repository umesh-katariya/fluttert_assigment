import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_assets.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {

  SplashScreen({Key? key}) : super(key: key);

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyView(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBodyView() {
    return Center(
      child: Image.asset(
        AppAssets.icLogo,
        height: 160.sp,
        width: 160.sp,
      ),
    );
  }

}
