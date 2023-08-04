import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'lang_directory/language_constant.dart';

showToast(String text) {
  Fluttertoast.showToast(
      msg: text, toastLength: Toast.LENGTH_LONG, fontSize: 16);
}

Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

Widget blankBox() {
  return const SizedBox(
    height: 0,
    width: 0,
  );
}

extension SizeExtention on num {
  SizedBox height() {
    return SizedBox(
      height: this.toDouble(),
    );
  }

  SizedBox width() {
    return SizedBox(
      width: this.toDouble(),
    );
  }
}

shareApp() async {
  String appLink = "app link";

  String shareText = "Check Out This Amazing App At : \n\n$appLink";

  Share.share(shareText);
}


emailUs() async {
  final Uri params =
      Uri(scheme: 'mailto', path: "mailid@gmail.com", queryParameters: {
    'subject': '${LanguageConstant.appLabel.tr} Contact Us',
  });
  String url = params.toString();

  await launch(url);
}

String formatDuration(Duration duration, {bool withSecond = true}) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  /*if(duration.inHours==0){
    return "$twoDigitMinutes:$twoDigitSeconds";
  }*/
  if (withSecond) {
    return "${twoDigits(duration.inHours)}h ${twoDigitMinutes}m ${twoDigitSeconds}s";
  }
  return "${twoDigits(duration.inHours)}h ${twoDigitMinutes}m";
}

String durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
}