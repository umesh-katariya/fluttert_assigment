import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../app_styles.dart';

class WebViewScreen extends StatefulWidget {
  String url;
  String title;
  WebViewScreen({Key? key,required this.url,required this.title}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  @override
  void initState() {
    super.initState();
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      title: Text(
        widget.title,
        style: AppStyles.blackRegular18.copyWith(fontWeight: FontWeight.w500),
      ),
      brightness: Brightness.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: WebviewScaffold(
        url: widget.url,
      ),
    );
  }
}
