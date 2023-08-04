import 'dart:convert';

import 'package:get/get.dart';

import '../../utils/urls_constants.dart';

abstract class IMainProvider {
  Future<Response> getDataResponseProvider(
      {required String endPoint,required var requestJson});
}

class MainAPIProvider extends GetConnect implements IMainProvider {
  @override
  void onInit() {
    //httpClient.defaultDecoder = (val) => MenuModel.fromJson(val);
    httpClient.baseUrl = UrlsConstants.adBaseUrl;
  }

  @override
  Future<Response> getDataResponseProvider(
      {required String endPoint,required var requestJson}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint,requestJson, headers: {
      "Content-type": "application/json",
      //"Authorization": "adminToken"
    });
  }
}