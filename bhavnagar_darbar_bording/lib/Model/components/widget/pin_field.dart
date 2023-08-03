import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bhavnagar_darbar_bording/main.dart';
import 'package:bhavnagar_darbar_bording/Controller/LoginController/UserInfoView.dart';
import '../../../Controller/TabController/TabBarView.dart';

class Filled extends StatefulWidget {
  const Filled({Key? key}) : super(key: key);

  @override
  _FilledState createState() => _FilledState();

  @override
  String toStringShort() => 'Filled';
}

class _FilledState extends State<Filled> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  String strOTP = '';
  bool isOTPNull = false;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle: GoogleFonts.poppins(
          fontSize: 20, color: GradientsColors.blackRussianColor),
      decoration:
          const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.8)),
    );

    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            width: 243,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: GradientsColors.melroseColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Pinput(
              length: 4,
              controller: controller,
              focusNode: focusNode,
              validator: (OTP) {
                if (OTP == null || OTP.isEmpty) {
                  strOTP = 'No';
                  isOTPNull = false;
                  return null;
                } else {
                  strOTP = OTP;
                  isOTPNull = true;
                  return null;
                }
              },
              // separator: Container(
              //   height: 64,
              //   width: 1,
              //   color: GradientsColors.oliveColor,
              // ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: GradientsColors.oliveColor,
                  //borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: GradientsColors.oliveColor),
                ),
              ),
              separatorBuilder: (index) => const SizedBox(width: 8),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: GradientsColors.oliveColor,
                  ),
                ],
              ),
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration:
                    const BoxDecoration(color: GradientsColors.dollyColor),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomeTextStyle(
            text: 'Didn’t receive code?',
            size: 16,
            color: GradientsColors.blackRussianColor,
            wordSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
          CustomeTextStyle(
            text: 'Resend',
            size: 16,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            onClick: () {
              print('Resend Click');
            },
          ),
          30.heightBox,
          RoundedButton(
            btnName: 'I’M Done',
            btnBGColor: Colors.transparent,
            btnStyle: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: GradientsColors.blackRussianColor,
            ),
            callback: () async {
              if (formKey.currentState!.validate()) {
                print('Enter OTP Value: $strOTP');

                if (isOTPNull == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: CustomeTextStyle(
                        text: 'Please enter OTP',
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: GradientsColors.dollyColor,
                        wordSpacing: 2,
                      ),
                    ),
                  );
                } else {
                  if (strOTP == '5555') {
                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setBool(SplashScreen.USERLOGIN, true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => TabView(),
                        builder: (context) => UserInfoView(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: CustomeTextStyle(
                          text: 'Please enter valid OTP',
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
                print('Validation No123');
              }
            },
          ).w(double.infinity).h(50),
        ],
      ),
    );
  }
}
