import 'package:get/get.dart';

import '../../service/APIProviders/main_api_provider.dart';
import '../../service/APIRepository/main_api_repository.dart';
import 'main_controller.dart';


class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(mainAPIRepository: Get.find()));
    Get.lazyPut<MainAPIProvider>(() => MainAPIProvider());
    Get.put(MainAPIRepository(mainAPIProvider: Get.find()));
  }
}
