import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:bhavnagar_darbar_bording/Controller/LoginController/OTPView.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/center_widget.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/pin_field.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/rounded_button.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/TabController/TabBarView.dart';

class UserInfoView extends StatefulWidget {
  @override
  State<UserInfoView> createState() => _UserInfoView();
}

class _UserInfoView extends State<UserInfoView> {
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

  late TextEditingController txtMobileNumber;

  String strFullName = '';
  String strCity = '';

  bool isSendOTP = false;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    txtMobileNumber = TextEditingController();
    txtMobileNumber.text = '9898989895';
  }

  @override
  void dispose() {
    txtMobileNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          SafeArea(
            child: Form(
              key: formGlobalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  double.infinity.widthBox,
                  const Spacer(),
                  _buildTitleText(context),
                  const Spacer(),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 16,
                    shadowColor: GradientsColors.dollyColor,
                    child: TextFormField(
                      validator: (FullName) {
                        if (FullName == null || FullName.isEmpty) {
                          strFullName = '';
                          return null;
                        } else {
                          strFullName = FullName;
                          return null;
                        }
                      },
                      obscureText: false,
                      controller: null,
                      keyboardType: TextInputType.number,
                      cursorColor: GradientsColors.melroseColor,
                      cursorWidth: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: GradientsColors.blackRussianColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 15,
                            left: 10,
                            bottom: 15), // add padding to adjust text
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Enter Your Full Name',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: GradientsColors.melroseColor,
                        ),
                      ),
                    ).px(12).py(2.5),
                  ),
                  12.heightBox,
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 16,
                    shadowColor: GradientsColors.dollyColor,
                    child: TextFormField(
                      validator: (CityName) {
                        if (CityName == null || CityName.isEmpty) {
                          strCity = '';
                          return null;
                        } else {
                          strCity = CityName;
                          return null;
                        }
                      },
                      obscureText: false,
                      controller: null,
                      keyboardType: TextInputType.number,
                      cursorColor: GradientsColors.melroseColor,
                      cursorWidth: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: GradientsColors.blackRussianColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 15,
                            left: 10,
                            bottom: 15), // add padding to adjust text
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Enter City',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: GradientsColors.melroseColor,
                        ),
                      ),
                    ).px(12).py(2.5),
                  ),
                  90.heightBox,
                  RoundedButton(
                    btnName: 'Done',
                    btnBGColor: Colors.transparent,
                    btnStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: GradientsColors.blackRussianColor,
                    ),
                    callback: () async {
                      print('Done Button CLick: $strFullName');
                      print('Done Button CLick: $strCity');
                      if (formGlobalKey.currentState!.validate()) {
                        print('Enter Full Name: $strFullName');
                        print('Enter City: $strCity');

                        if (strFullName.length == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: CustomeTextStyle(
                                text: 'Please enter full name',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: GradientsColors.oliveColor,
                                wordSpacing: 2,
                              ),
                            ),
                          );
                        } else if (strCity.length == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: CustomeTextStyle(
                                text: 'Please enter city',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: GradientsColors.oliveColor,
                                wordSpacing: 2,
                              ),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TabView(),
                            ),
                          );
                        }
                      } else {
                        print('Validation mobile number');
                      }
                    },
                  ).w(double.infinity).h(50),
                  const Spacer(),
                  const Spacer(),
                ],
              ).p(24),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildTitleText(BuildContext context) {
    return Column(
      children: [
        Text(
          "Login",
          style: GoogleFonts.caveat(
            fontSize: 70,
            fontWeight: FontWeight.w600,
            wordSpacing: 1,
            color: Colors.white, //GradientsColors.jaggerColor,
          ),
        ),
        Text(
          'Bhavnagar Darbar Bording',
          style: GoogleFonts.caveat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            wordSpacing: 1,
            color: Colors.white, //GradientsColors.jaggerColor,
          ),
        ),
      ],
    );
  }
}

/*
SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                double.infinity.widthBox,
                20.heightBox,
                TextField(
                  controller: txtMobileNumber,
                  keyboardType: TextInputType.number,
                  cursorColor: GradientsColors.dollyColor,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: GradientsColors.melroseColor,
                    wordSpacing: 1,
                  ),
                  onSubmitted: (String value) async {
                    print('Value OF String: $value');
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: const BorderSide(
                          color: GradientsColors.dollyColor, width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: GradientsColors.dollyColor, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.yellow, width: 1.0)),
                    labelText: 'Mobile Number',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: GradientsColors.dollyColor,
                      wordSpacing: 1,
                    ),
                    hintText: 'Enter Your Mobile Number',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: GradientsColors.melroseColor,
                      wordSpacing: 1,
                    ),
                  ),
                  readOnly: isSendOTP == true ? true : false,
                ),
                20.heightBox,
                TextField(
                  controller: txtMobileNumber,
                  keyboardType: TextInputType.number,
                  cursorColor: GradientsColors.dollyColor,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: GradientsColors.melroseColor,
                    wordSpacing: 1,
                  ),
                  onSubmitted: (String value) async {
                    print('Value OF String: $value');
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: const BorderSide(
                          color: GradientsColors.dollyColor, width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: GradientsColors.dollyColor, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.yellow, width: 1.0)),
                    labelText: 'Mobile Number',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: GradientsColors.dollyColor,
                      wordSpacing: 1,
                    ),
                    hintText: 'Enter Your Mobile Number',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: GradientsColors.melroseColor,
                      wordSpacing: 1,
                    ),
                  ),
                  readOnly: isSendOTP == true ? true : false,
                ),
                40.heightBox,
                RoundedButton(
                  btnName: 'Login',
                  btnBGColor: Colors.transparent,
                  btnStyle: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: GradientsColors.blackRussianColor,
                  ),
                  callback: () async {},
                ).w(double.infinity).h(50),
                const Spacer(),
                const Spacer(),
                InkWell(
                  onTap: () {},
                ),
              ],
            ).p(24),
          ),
 */
