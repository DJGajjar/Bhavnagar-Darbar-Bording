import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/rounded_button.dart';
import 'package:bhavnagar_darbar_bording/Controller/TabController/PaperView/PaperShowViewController.dart';

class MaterialViewController extends StatefulWidget {
  const MaterialViewController({Key? key}) : super(key: key);

  @override
  State<MaterialViewController> createState() => _MaterialViewController();
}

class _MaterialViewController extends State<MaterialViewController> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var arrPlayerList = [
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
      {
        'PaperID': '1',
        'SubjectName': 'Subject Name',
        'PaperDate': '4, Aug 2023',
        'PaperUrl': '',
      },
    ];

    return ListView.separated(
      itemCount: arrPlayerList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: CustomeTextStyle(
            text: arrPlayerList[index]['SubjectName'].toString(),
            size: 16,
            fontWeight: FontWeight.w500,
            color: GradientsColors.melroseColor,
            wordSpacing: 2,
          ),
          subtitle: CustomeTextStyle(
            text: arrPlayerList[index]['PaperDate'].toString(),
            size: 10,
            fontWeight: FontWeight.w500,
            color: GradientsColors.melroseColor,
            wordSpacing: 2,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: GradientsColors.dollyColor,
          ),
          onTap: () {
            print('Click To Navigation: $index');

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaperShowViewController()),
            );
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
