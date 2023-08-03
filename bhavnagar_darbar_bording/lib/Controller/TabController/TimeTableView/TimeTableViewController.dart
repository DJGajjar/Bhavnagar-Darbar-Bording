import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Model/TimeTable/TimeTableList.dart';
import 'package:bhavnagar_darbar_bording/Model/TimeTable/TimeTableDetailList.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:getwidget/getwidget.dart';

class TimeTableViewController extends StatefulWidget {
  const TimeTableViewController({Key? key}) : super(key: key);

  @override
  State<TimeTableViewController> createState() =>
      _TimeTableViewControllerState();
}

class _TimeTableViewControllerState extends State<TimeTableViewController> {
  @override
  Widget build(BuildContext context) {
    // final List<TimeTableDetailList> arrSquadsList =
    //     TimeTableList.getSquadsList();

    //Date, Day, Sub, Time, Faculty name, Details
    var arrMyMatchesList = [
      {
        'FacultyName': 'Faculty Name',
        'Subject': 'Subject Name',
        'Time': '10:30 PM',
        'Note': 'Information about lecture',
      },
      {
        'FacultyName': 'Faculty Name',
        'Subject': 'Subject Name',
        'Time': '10:30 PM',
        'Note': '-',
      },
      {
        'FacultyName': 'Faculty Name',
        'Subject': 'Subject Name',
        'Time': '10:30 PM',
        'Note': '-',
      },
      {
        'FacultyName': 'Faculty Name',
        'Subject': 'Subject Name',
        'Time': '10:30 PM',
        'Note': 'Information about lecture',
      },
      {
        'FacultyName': 'Faculty Name',
        'Subject': 'Subject Name',
        'Time': '10:30 PM',
        'Note': '-',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 35,
          color: GradientsColors.melroseColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 7),
                      child: Container(
                        child: CustomeTextStyle(
                          text: '4, Aug 2023',
                          size: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10, top: 7),
                      child: Container(
                        child: CustomeTextStyle(
                          text: 'Friday',
                          size: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 240,
          child: ListView.separated(
              itemCount: arrMyMatchesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => MatchDetailInfoViewController()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 126,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, left: 10.0, right: 5.0),
                                    child: CustomeTextStyle(
                                      text: 'Faculty Name:',
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                      color: GradientsColors.blackRussianColor,
                                      wordSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 9,
                                child: Container(
                                  height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 3),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: arrMyMatchesList[index]
                                                    ['FacultyName']
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  GradientsColors.melroseColor,
                                              wordSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, left: 10.0, right: 5.0),
                                    child: CustomeTextStyle(
                                      text: 'Subject:',
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                      color: GradientsColors.blackRussianColor,
                                      wordSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 11,
                                child: Container(
                                  height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 3),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: arrMyMatchesList[index]
                                                    ['Subject']
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  GradientsColors.melroseColor,
                                              wordSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, left: 10.0, right: 5.0),
                                    child: CustomeTextStyle(
                                      text: 'Time:',
                                      size: 16,
                                      fontWeight: FontWeight.w500,
                                      color: GradientsColors.blackRussianColor,
                                      wordSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 11,
                                child: Container(
                                  height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 3),
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: arrMyMatchesList[index]
                                                    ['Time']
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  GradientsColors.melroseColor,
                                              wordSpacing: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 0.5,
                          color: GradientsColors.oliveColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 10.0, right: 10.0),
                          child: Container(
                            height: 30,
                            width: double.infinity,
                            child: CustomeTextStyle(
                              text: 'Note: ' +
                                  arrMyMatchesList[index]['Note'].toString(),
                              size: 14,
                              fontWeight: FontWeight.w500,
                              color: GradientsColors.dollyColor,
                              wordSpacing: 2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  color: GradientsColors.dollyColor,
                );
              }),
        ),
      ],
    );
  }
}
