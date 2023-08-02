import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:bhavnagar_darbar_bording/Model/components/widget/center_widget.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/rounded_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bhavnagar_darbar_bording/main.dart';
import '../TabController/TabBarView.dart';

class OtpPage extends StatefulWidget {
  final Widget pinPut;

  const OtpPage(this.pinPut, {Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();

  @override
  String toStringShort() => pinPut.toStringShort();
}

class _OtpPageState extends State<OtpPage> with AutomaticKeepAliveClientMixin {
  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [
              GradientsColors.blackRussianColor,
              GradientsColors.dollyColor,
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment(0.6, -1.1),
          end: Alignment(0.7, 0.8),
          colors: [
            GradientsColors.blackRussianColor,
            GradientsColors.dollyColor,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            child: topWidget(screenSize.width),
          ),
          Positioned(
            bottom: -180,
            left: -40,
            child: bottomWidget(screenSize.width),
          ),
          CenterWidget(size: screenSize),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
              child: Center(
                child: Column(
                  children: [
                    const OtpHeader(),
                    widget.pinPut,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class OtpHeader extends StatelessWidget {
  const OtpHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomeTextStyle(
          text: 'Verification Code',
          size: 24,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        const SizedBox(height: 24),
        CustomeTextStyle(
          text:
              "We have sent you an SMS with a code to the number bellow. \n\n To complete your phone number verification, Please enter the activation code.",
          size: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        CustomeTextStyle(
          text: '+91 99045-50306',
          size: 14,
          fontWeight: FontWeight.w700,
          color: GradientsColors.blackRussianColor,
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}
