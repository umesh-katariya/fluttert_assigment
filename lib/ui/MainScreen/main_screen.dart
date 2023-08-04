import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_util/common_appbar.dart';
import '../../utils/common_util/drawer_view.dart';
import '../../utils/lang_directory/language_constant.dart';
import 'main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final MainController controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: _buildAppBar(),
      body: _buildBodyView(),
      drawer: const DrawerView(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: CommonAppBar(
        title: LanguageConstant.appLabel.tr,
        scaffoldKey: controller.scaffoldKey,
      ),
    );
  }

  Widget _buildBodyView() {
    return Center(
      child: Obx(() => Text("${controller.batteryLevel}")),
    );
  }

}
