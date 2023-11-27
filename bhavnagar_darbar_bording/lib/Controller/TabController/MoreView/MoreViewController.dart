import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:bhavnagar_darbar_bording/Controller/TabController/MoreView/ProfileViewController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bhavnagar_darbar_bording/Controller/TabController/MoreView/ProfileViewController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/rounded_button.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/pin_field.dart';
import 'package:intl/intl.dart';
// import 'package:share_plus/share_plus.dart';

class MoreViewController extends StatefulWidget {
  const MoreViewController({Key? key}) : super(key: key);

  @override
  State<MoreViewController> createState() => _MoreViewController();
}

class _MoreViewController extends State<MoreViewController> {
  String strAction = '';

  var arrSettingList = [
    {
      'optionTitle': 'Profile',
      'optionSubTitle': 'Check Your Profile',
      'optionIcon': 'assets/images/Feed/cricket.png',
      'isDetail': 'Y',
    },
    {
      'optionTitle': 'Contact Us',
      'optionSubTitle': 'Create Same Application',
      'optionIcon': 'assets/images/Feed/cricket.png',
      'isDetail': 'Y',
    },
    {
      'optionTitle': 'Support',
      'optionSubTitle': 'Any Info Share',
      'optionIcon': 'assets/images/Feed/cricket.png',
      'isDetail': 'Y',
    },
    {
      'optionTitle': 'Share',
      'optionSubTitle': 'Share The Application',
      'optionIcon': 'assets/images/Feed/cricket.png',
      'isDetail': 'N',
    },
    {
      'optionTitle': 'Rate',
      'optionSubTitle': 'Rate The Application',
      'optionIcon': 'assets/images/Feed/cricket.png',
      'isDetail': 'N',
    },
    {
      'optionTitle': 'Log Out',
      'optionSubTitle': 'Application LogOut',
      'optionIcon': 'assets/images/Feed/cricket.png',
      'isDetail': 'N',
    },
  ];

  // void _shareAppLink(String text) {
  //   Share.share(text);
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: arrSettingList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: CustomeTextStyle(
            text: arrSettingList[index]['optionTitle'].toString(),
            size: 16,
            fontWeight: FontWeight.w500,
            color: GradientsColors.melroseColor,
            wordSpacing: 2,
          ),
          subtitle: CustomeTextStyle(
            text: arrSettingList[index]['optionSubTitle'].toString(),
            size: 10,
            fontWeight: FontWeight.w500,
            color: GradientsColors.melroseColor,
            wordSpacing: 2,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: arrSettingList[index]['isDetail'].toString() != 'N'
                ? GradientsColors.dollyColor
                : Colors.transparent,
          ),
          onTap: () {
            print('Click To Navigation: $index');
            strAction = arrSettingList[index]['optionTitle']!;

            if (strAction == 'Profile') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileViewController(Filled())),
              );
            } else if (strAction == 'Contact Us') {
            } else if (strAction == 'Support') {
            } else if (strAction == 'Share') {
              // _shareAppLink('Hello, Application Link Share');
            } else if (strAction == 'Rate') {
            } else if (strAction == 'Log Out') {}
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 0.5,
          color: GradientsColors.dollyColor,
        );
      },
    );
  }
}
