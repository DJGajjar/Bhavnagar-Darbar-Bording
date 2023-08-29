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
//import 'package:bhavnagar_darbar_bording/Model/textfields.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_number/phone_number.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:bhavnagar_darbar_bording/Extra/Constant.dart';
import 'dart:convert';
import 'dart:io';
import 'package:bhavnagar_darbar_bording/Extra/APIService.dart';
import 'package:bhavnagar_darbar_bording/Model/UserDetail/UserModelList.dart';
import 'package:bhavnagar_darbar_bording/Model/UserDetail/UserDetail.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:bhavnagar_darbar_bording/Extra/loading_overlay_alt.dart';

class LoginViewController extends StatefulWidget {
  const LoginViewController({Key? key}) : super(key: key);

  @override
  State<LoginViewController> createState() => _LoginViewControllerState();
}

class _LoginViewControllerState extends State<LoginViewController>
    with TickerProviderStateMixin {
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

  final countryPicker = FlCountryCodePicker();
  CountryCode? countryCode;

  final HttpService _apiClient = HttpService();

  late String strCountryName = '+91 India';
  late String strCountryCode = '+91';

  late AnimationController addToCartPopUpAnimationController;

  String strMobileNumber = '';
  String strMsg = '';
  bool isMobileNumberNull = false;

  var isDataSubmitting = false;
  var isDataReadingCompleted = false;

  @override
  void initState() {
    addToCartPopUpAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));

    super.initState();
  }

  final formGlobalKey = GlobalKey<FormState>();

  void loginWithPhoneNumber(String mobileNumber) async {
    isDataSubmitting = true;

    // LoadingOverlayAlt.of(context).show();

    try {
      Response response = await post(
        Uri.parse(BaseURL.login),
        body: {
          'mobilenumber': mobileNumber,
        },
      );

      if (response.statusCode == 200) {
        print('Login Succes');

        var responseData = jsonDecode(response.body)['userdata'];

        isDataSubmitting = false;

        // Map<String, dynamic> responseData = jsonDecode(response.body.toString());

        UserDataList.user_id = UserDetail.fromJson(responseData).user_id;
        UserDataList.isuserdetails =
            UserDetail.fromJson(responseData).isuserdetails;
        UserDataList.isverify = UserDetail.fromJson(responseData).isverify;
        UserDataList.username = UserDetail.fromJson(responseData).username;
        UserDataList.city = UserDetail.fromJson(responseData).city;
        UserDataList.mobilenumber =
            UserDetail.fromJson(responseData).mobilenumber;

        isDataReadingCompleted = true;

        // LoadingOverlayAlt.of(context).hide();

        print('MobileNumberU: ${UserDataList.isverify}');
      } else {
        isDataSubmitting = false;
        print('Failed');
      }
    } catch (e) {
      isDataSubmitting = false;
      print(e.toString());
    }
  }

  @override
  void dispose() {
    addToCartPopUpAnimationController.dispose();
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
                  const Spacer(),
                  _buildTitleText(context),
                  const Spacer(),
                  const Text(
                    "+91 India",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: GradientsColors.blackRussianColor,
                    ),
                  ),
                  20.heightBox,
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 16,
                    shadowColor: GradientsColors.dollyColor,
                    child: TextFormField(
                      validator: (MobileNumber) {
                        if (MobileNumber == null || MobileNumber.isEmpty) {
                          strMobileNumber = 'No';
                          isMobileNumberNull = false;
                          return null;
                        } else {
                          strMobileNumber = MobileNumber;
                          isMobileNumberNull = true;
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
                        hintText: 'Enter Mobile Number',
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
                    btnName: 'Login',
                    btnBGColor: Colors.transparent,
                    btnStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: GradientsColors.blackRussianColor,
                    ),
                    callback: () async {
                      print('Login Button CLick: $strCountryCode');
                      if (formGlobalKey.currentState!.validate()) {
                        print('Enter mobile number: $strMobileNumber');

                        if (isMobileNumberNull == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: CustomeTextStyle(
                                text: 'Please enter mobile number',
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: GradientsColors.oliveColor,
                                wordSpacing: 2,
                              ),
                            ),
                          );
                        } else {
                          if (strMobileNumber.length == 10) {
                            loginWithPhoneNumber(strMobileNumber);
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => OtpPage(Filled()),
                            //   ),
                            // );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: CustomeTextStyle(
                                  text: 'Please enter valid mobile number',
                                  size: 16,
                                  fontWeight: FontWeight.w600,
                                  color: GradientsColors.dollyColor,
                                  wordSpacing: 2,
                                ),
                              ),
                            );
                          }
                        }
                      } else {
                        print('Validation mobile number');
                      }
                    },
                  ).w(double.infinity).h(50),
                  const Spacer(),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      addToCartPopUpAnimationController.forward();
                    },
                    child: CustomeTextStyle(
                      text: 'WHY PHONE NUMBER?',
                      size: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white, //GradientsColors.dollyColor,
                      wordSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By signing in, you agree to our ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            wordSpacing: 1,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: GradientsColors.jaggerColor,
                            fontWeight: FontWeight.w900,
                            wordSpacing: 1,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //Navigation
                            },
                        ),
                        TextSpan(
                          text: ' and ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            wordSpacing: 1,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: GradientsColors.jaggerColor,
                            fontWeight: FontWeight.w900,
                            wordSpacing: 1,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //Navigation
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ).p(24),
            ),
          ),
          addToCartPopUp(),
        ],
      ),
    );
  }

  addToCartPopUp() {
    return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(addToCartPopUpAnimationController),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 12,
                color: GradientsColors.dollyColor,
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Why My Phone Number?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: GradientsColors.blackRussianColor,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Bhavnagar Darbar Bording use phone number to uniquely identify players. No one would have access to your phone number without your consent.',
                            style: TextStyle(
                              color: GradientsColors.blackRussianColor,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {
                            addToCartPopUpAnimationController.reverse();
                          },
                          child: const Icon(
                            Icons.cancel,
                            color: GradientsColors.blackRussianColor,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
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
