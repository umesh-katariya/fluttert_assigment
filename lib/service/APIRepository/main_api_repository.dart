import 'dart:convert';

import '../../utils/urls_constants.dart';
import '../../utils/validator.dart';
import '../APIProviders/main_api_provider.dart';
import '../repository_adapter.dart';

class MainAPIRepository implements IMainRepository {

  final MainAPIProvider mainAPIProvider;

  MainAPIRepository({required this.mainAPIProvider});

  @override
  Future<dynamic> getDataAPIResponse({required var requestJson}) async {
    final response = await mainAPIProvider.getDataResponseProvider(endPoint: UrlsConstants.getUser,requestJson: requestJson);
    if (response != null) {
      print("response.statusCode -> ");
      print(response.statusCode);
    }
    if(response.status.hasError) {
      Validators.apiResponseMessage(body: jsonEncode(response.body!), message: response.statusText);
      return null;
    } else {
      return response.body!;
    }
  }

}