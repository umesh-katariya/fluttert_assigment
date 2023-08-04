import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pref_util.dart';
import 'en.dart';
import 'gu.dart';
import 'hi.dart';

class TranslationService extends Translations{

  static Locale? get locale => PreferenceUtils.getLanguage()=="G"?const Locale('gu', 'IN'):(PreferenceUtils.getLanguage()=="H"?const Locale('hi', 'IN'):const Locale('en', 'US'));
  static const fallbackLocale = Locale('en', 'IN');

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'gu': gu,
    'hi': hi,
    'en': en
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) async {
    //final locale = _getLocaleFromLanguage(lang);

    if(lang=="gu_IN"){
      await PreferenceUtils.setLanguage(value: "G");
    }else if(lang=="hi_IN"){
      await PreferenceUtils.setLanguage(value: "H");
    }else {
      await PreferenceUtils.setLanguage(value: "E");
    }

    Get.updateLocale(Locale(lang));
  }

}