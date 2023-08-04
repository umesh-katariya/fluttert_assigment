import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../utils/pref_util.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await PreferenceUtils.init();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed("/main");
      },
    );

    initializeDateFormatting();

    super.onInit();
  }
}
