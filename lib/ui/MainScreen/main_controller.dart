import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../service/APIRepository/main_api_repository.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {

  final MainAPIRepository mainAPIRepository;

  MainController({required this.mainAPIRepository});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController animationController;

  RxString batteryLevel="Data".obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animationController.repeat(reverse: true);

    Future.delayed(Duration.zero, () {
      getData();
    });
  }

  getData() async {

    var requestJson = {
      "Mobile" : "8000085921"
    };

    var data = await mainAPIRepository.getDataAPIResponse(requestJson: requestJson);

    print("data $data");
  }


  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
