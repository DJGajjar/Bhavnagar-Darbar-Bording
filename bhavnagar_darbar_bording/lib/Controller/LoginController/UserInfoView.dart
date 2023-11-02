import 'dart:convert';
import 'dart:io';

import 'package:bhavnagar_darbar_bording/Extra/Constant.dart';
import 'package:bhavnagar_darbar_bording/Model/UserDetail/UserDetail.dart';
import 'package:bhavnagar_darbar_bording/Model/UserDetail/UserModelList.dart';
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
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/TabController/TabBarView.dart';
import 'package:get_storage/get_storage.dart';

import '../../Model/UserDetail/UpdateUserDetail.dart';
import '../../Model/UserDetail/UpdateUserModelList.dart';
import '../../main.dart';

class UserInfoView extends StatefulWidget {
  @override
  State<UserInfoView> createState() => _UserInfoView();
}

class _UserInfoView extends State<UserInfoView> {
  late TextEditingController txtMobileNumber;

  String strFullName = '';
  String strCity = '';

  bool isSendOTP = false;

  var isDataSubmitting = false;
  var isDataReadingCompleted = false;

  final formGlobalKey = GlobalKey<FormState>();
  final userInfoToken = GetStorage();

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
  void initState() {
    super.initState();
    txtMobileNumber = TextEditingController();
    txtMobileNumber.text = '9898989895';
  }

  void loginWithUserInfoPhoneNumber(String fullname, String city) async {
    isDataSubmitting = true;

    print('Method Call Update Profile');

    String strToken = userInfoToken.read('Token');

    print('strToken: $strToken');
    print('FullNmae: $fullname');
    print('City: $city');

    try {
      Response response = await http.post(
        Uri.parse(BaseURL.updateProfile),
        headers: {
          "Authorization": strToken,
        },
        body: {
          'full_name': fullname,
          'city': city,
        },
      );

      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      print('Value Of Responce: $responseJson');

      if (response.statusCode == 200) {
        print('update Profile Succes');

        isDataSubmitting = false;

        Map<String, dynamic> responseData =
            jsonDecode(response.body.toString());

        print('Response Data: ${responseData['status']}');

        if (responseData['status'] == 0) {
          print(
              'Display Alert Msg: ${UpdateUserDetail.fromJson(responseData).message}');
        } else {
          print('Value Call');
          var responseData = jsonDecode(response.body)['data'];
          print('Value Call: $responseData');

          UpdateUserDetailList.student_id =
              UpdateUserDetail.fromJson(responseData).student_id;
          UpdateUserDetailList.full_name =
              UpdateUserDetail.fromJson(responseData).full_name;
          UpdateUserDetailList.city =
              UpdateUserDetail.fromJson(responseData).city;
          UpdateUserDetailList.mobile_number =
              UpdateUserDetail.fromJson(responseData).mobile_number;
          UpdateUserDetailList.status =
              UpdateUserDetail.fromJson(responseData).status;
          UpdateUserDetailList.is_profile_completed =
              UpdateUserDetail.fromJson(responseData).is_profile_completed;

          if (UpdateUserDetailList.is_profile_completed == '1') {
            var sharedPref = await SharedPreferences.getInstance();
            sharedPref.setBool(SplashScreen.USERLOGIN, true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TabView(),
              ),
            );
          } else {}
        }

        isDataReadingCompleted = true;

        // LoadingOverlayAlt.of(context).hide();

        print('MobileNumberU: ${UpdateUserDetailList.mobile_number}');
      } else {
        isDataSubmitting = false;
        print('Failed');
      }
    } catch (e) {
      isDataSubmitting = false;
      print(e.toString());
    }
  }
  /*void loginWithUserInfoPhoneNumber(String fullname, String city) async {
    isDataSubmitting = true;

    String strToken = userInfoToken.read('Token');

    print('FullNmae: $fullname');
    print('City: $city');

    try {
      Response response = await post(
        Uri.parse(BaseURL.updateProfile),
        headers: {"Authorization": strToken},
        body: {
          'full_name': fullname,
          'city': city,
        },
      );

      if (response.statusCode == 200) {
        print('Login Info Detail Succes');

        var responseData = jsonDecode(response.body)['data'];

        isDataSubmitting = false;

        UserDataList.student_id = UserDetail.fromJson(responseData).student_id;
        UserDataList.full_name = UserDetail.fromJson(responseData).full_name;
        UserDataList.city = UserDetail.fromJson(responseData).city;
        UserDataList.mobile_number =
            UserDetail.fromJson(responseData).mobile_number;
        UserDataList.status = UserDetail.fromJson(responseData).status;
        UserDataList.is_profile_completed =
            UserDetail.fromJson(responseData).is_profile_completed;

        isDataReadingCompleted = true;

        // LoadingOverlayAlt.of(context).hide();

        print('MobileNumberU: ${UserDataList.mobile_number}');

        if (UserDataList.is_profile_completed == '1') {
          var sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool(SplashScreen.USERLOGIN, true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TabView(),
            ),
          );
        } else {}
      } else {
        isDataSubmitting = false;
        print('Failed');
      }
    } catch (e) {
      isDataSubmitting = false;
      print(e.toString());
    }
  }*/

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
                          print('Enter Condition View');
                          loginWithUserInfoPhoneNumber(strFullName, strCity);
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
