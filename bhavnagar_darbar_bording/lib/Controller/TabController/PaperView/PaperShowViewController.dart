import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';

class PaperShowViewController extends StatefulWidget {
  const PaperShowViewController({Key? key}) : super(key: key);

  @override
  State<PaperShowViewController> createState() => _PaperShowViewController();
}

class _PaperShowViewController extends State<PaperShowViewController> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: 'Paper Name',
          size: 18,
          color: GradientsColors.melroseColor,
          wordSpacing: 1,
          fontWeight: FontWeight.w600,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[
                GradientsColors.blackRussianColor,
                GradientsColors.dollyColor,
              ],
            ),
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
