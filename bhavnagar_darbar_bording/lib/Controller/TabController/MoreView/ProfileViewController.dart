import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/rounded_button.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/pin_field.dart';
import 'package:intl/intl.dart';

class ProfileViewController extends StatefulWidget {
  final Widget pinPut;

  const ProfileViewController(this.pinPut, {Key? key}) : super(key: key);

  @override
  State<ProfileViewController> createState() => _ProfileViewController();
}

class _ProfileViewController extends State<ProfileViewController> {
  late TextEditingController txtName;
  late TextEditingController txtLocation;
  late TextEditingController txtMobileNumber;
  late FocusNode focusNode;

  bool isSendOTP = false;

  String strMobileNumber = '';

  @override
  void initState() {
    super.initState();
    txtName = TextEditingController();
    txtName.text = 'Darshan Jolapara';

    txtLocation = TextEditingController();
    txtLocation.text = 'Rajkot';

    txtMobileNumber = TextEditingController();
    txtMobileNumber.text = '9898989895';

    strMobileNumber = txtMobileNumber.text;

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    txtName.dispose();
    txtLocation.dispose();
    txtMobileNumber.dispose();
    focusNode = FocusNode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: 'Profile',
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
      body: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        child: TextField(
                          controller: txtName,
                          keyboardType: TextInputType.text,
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
                                  color: GradientsColors.dollyColor,
                                  width: 1.5),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: GradientsColors.dollyColor,
                                  width: 1.5),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 1.0)),
                            labelText: 'Name',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: GradientsColors.dollyColor,
                              wordSpacing: 1,
                            ),
                            hintText: 'Enter Your Name',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: GradientsColors.melroseColor,
                              wordSpacing: 1,
                            ),
                          ),
                          focusNode: focusNode,
                        ),
                      ),
                      20.heightBox,
                      Container(
                        height: 60,
                        child: TextField(
                          controller: txtLocation,
                          keyboardType: TextInputType.text,
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
                                  color: GradientsColors.dollyColor,
                                  width: 1.5),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: GradientsColors.dollyColor,
                                  width: 1.5),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 1.0)),
                            labelText: 'Location',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: GradientsColors.dollyColor,
                              wordSpacing: 1,
                            ),
                            hintText: 'Enter Your Location',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: GradientsColors.melroseColor,
                              wordSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      20.heightBox,
                      Container(
                        height: 60,
                        child: TextField(
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
                                  color: GradientsColors.dollyColor,
                                  width: 1.5),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: GradientsColors.dollyColor,
                                  width: 1.5),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.yellow, width: 1.0)),
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
                      ),
                      40.heightBox,
                      Container(
                        child: isSendOTP == true ? widget.pinPut : Container(),
                      ),
                      40.heightBox,
                      RoundedButton(
                        btnName: 'Update',
                        btnBGColor: Colors.transparent,
                        btnStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: GradientsColors.blackRussianColor,
                        ),
                        callback: () {
                          setState(() {
                            if (isSendOTP == false) {
                              if (txtMobileNumber.text == strMobileNumber) {
                                Navigator.pop(context);
                              } else {
                                isSendOTP = true;
                              }
                            } else {
                              Navigator.pop(context);
                            }
                          });
                        },
                      ).px(40).h(50),
                      5.heightBox,
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
