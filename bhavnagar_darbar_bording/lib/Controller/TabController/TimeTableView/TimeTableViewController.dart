import 'dart:convert';

import 'package:bhavnagar_darbar_bording/Model/TimeTable/TimeTableDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../Extra/Constant.dart';
import '../../../main.dart';

class TimeTableViewController extends StatefulWidget {
  const TimeTableViewController({Key? key}) : super(key: key);

  @override
  State<TimeTableViewController> createState() =>
      _TimeTableViewControllerState();
}

class _TimeTableViewControllerState extends State<TimeTableViewController> {
  var isApiCAll = 'No';
  var isDataFound = 'Yes';

  List<TimeTableDetail>? timeTable = <TimeTableDetail>[];

  final userInfoToken = GetStorage();

  @override
  void initState() {
    print('API CAll State');

    isApiCAll = 'Yes';
    super.initState();
    getTimeTableDataList();
  }

  Future<void> getTimeTableDataList() async {
    print('CVlll aasmdas, a');

    var sharePref = await SharedPreferences.getInstance();
    var strToken = sharePref.getString(SplashScreen.TOKEN);
    print('Token : $strToken');

    try {
      Response response = await get(
        Uri.parse(BaseURL.scheduleList),
        headers: {
          "Authorization": strToken.toString(),
        },
      );

      Map<String, dynamic> responseData = jsonDecode(response.body.toString());

      print('Response Data: $responseData');

      if (responseData['status'] == 0) {
        print(
            'Display Alert Msg: ${TimeTableDetail.fromJson(responseData).message}');
        isApiCAll = 'No';
        isDataFound = 'No';
        setState(() => {});
      } else {
        var responseData = jsonDecode(response.body)['data'];

        timeTable = responseData
            .map((timeTable) => TimeTableDetail.fromJson(timeTable))
            .toList()
            .cast<TimeTableDetail>();

        print('Date: ${timeTable?[0].schedule_date}');
        print('Schecdule ID: ${timeTable?[0].schedule?[0]['id']}');
        print('Schecdule List: ${timeTable?[1].schedule?.length.toInt()}');
        print('Length OF Response: ${timeTable?.length.toInt()}');

        isApiCAll = 'No';
        setState(() => {});

        // Future.delayed(Duration(seconds: 5)).then((timeTable) {
        //
        // });
      }
    } catch (e) {
      isApiCAll = 'No';
      setState(() => {});
      print('Error Show: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final List<TimeTableDetailList> arrSquadsList =
    //     TimeTableList.getSquadsList();

    //Date, Day, Sub, Time, Faculty name, Details
    /*var arrMyMatchesList = [
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
    ];*/

    final screenSize = MediaQuery.of(context).size;
    double deviceHeight(BuildContext context) => screenSize.height / 2;
    print('VAlue if Height: ${deviceHeight(context)}');

    return /*GroupedListView<dynamic, String>(
      elements: timeTable!,
      groupBy: (element) =>
          element['schedule_date'] + ' ' + element['schedule_day'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) =>
          item1['schedule_date'].compareTo(item2['schedule_day']),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height - 240,
          child: ListView.separated(
              itemCount: timeTable![index].schedule![0].length,
              itemBuilder: (context, index) {
                print('Index Total Count: $index');
                return InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
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
                                            text: 'Test',
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
                                            text: 'test',
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
                                            text: 'test',
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
                              text: 'test',
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
        );
        //   Card(
        //   elevation: 8.0,
        //   margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        //   child: SizedBox(
        //     child: ListTile(
        //       contentPadding:
        //           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        //       leading: const Icon(Icons.account_circle),
        //       title: Text('Index Count:' + index.toString()),
        //       trailing: const Icon(Icons.arrow_forward),
        //     ),
        //   ),
        // );
      },
    );*/
        isApiCAll == "Yes"
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Colors.blue,
                ),
              )
            : isDataFound == 'No'
                ? Center(
                    child: CustomeTextStyle(
                      text: 'Time Table Data Not Found',
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: GradientsColors.melroseColor,
                      wordSpacing: 2,
                    ),
                  )
                : ListView.builder(
                    itemCount: timeTable!.length.toInt(),
                    itemBuilder: (context, index) {
                      return StickyHeader(
                        header: Container(
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
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 7),
                                      child: Container(
                                        child: CustomeTextStyle(
                                          text: timeTable![index]
                                              .schedule_date
                                              .toString(),
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
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 7),
                                      child: Container(
                                        child: CustomeTextStyle(
                                          text: timeTable![index]
                                              .schedule_day
                                              .toString(),
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
                        content: Container(
                          width: double.infinity,
                          height:
                              timeTable![index].schedule!.length.toInt() == 1
                                  ? (126 *
                                          timeTable![index]
                                              .schedule!
                                              .length
                                              .toInt()) +
                                      0
                                  : (126 *
                                          timeTable![index]
                                              .schedule!
                                              .length
                                              .toInt()) +
                                      35,
                          // color: Colors.red,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                timeTable![index].schedule!.length.toInt(),
                            itemBuilder: (context, subIndex) {
                              return Column(
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
                                                  top: 0.0,
                                                  left: 10.0,
                                                  right: 5.0),
                                              child: CustomeTextStyle(
                                                text: 'Faculty Name:',
                                                size: 16,
                                                fontWeight: FontWeight.w500,
                                                color: GradientsColors
                                                    .blackRussianColor,
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
                                                      text: timeTable![index]
                                                          .schedule![subIndex]
                                                              ['faculty_name']
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: GradientsColors
                                                            .melroseColor,
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
                                                  top: 0.0,
                                                  left: 10.0,
                                                  right: 5.0),
                                              child: CustomeTextStyle(
                                                text: 'Subject:',
                                                size: 16,
                                                fontWeight: FontWeight.w500,
                                                color: GradientsColors
                                                    .blackRussianColor,
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
                                                      text: timeTable![index]
                                                          .schedule![subIndex]
                                                              ['subject_name']
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: GradientsColors
                                                            .melroseColor,
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
                                                  top: 0.0,
                                                  left: 10.0,
                                                  right: 5.0),
                                              child: CustomeTextStyle(
                                                text: 'Time:',
                                                size: 16,
                                                fontWeight: FontWeight.w500,
                                                color: GradientsColors
                                                    .blackRussianColor,
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
                                                      text: timeTable![index]
                                                          .schedule![subIndex]
                                                              ['class_time']
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: GradientsColors
                                                            .melroseColor,
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
                                        text: timeTable![index]
                                                    .schedule![subIndex]['note']
                                                    .toString() ==
                                                ''
                                            ? 'Note: -'
                                            : 'Note: ' +
                                                timeTable![index]
                                                    .schedule![subIndex]['note']
                                                    .toString(),
                                        size: 14,
                                        fontWeight: FontWeight.w500,
                                        color: GradientsColors.dollyColor,
                                        wordSpacing: 2,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1,
                                color: GradientsColors.dollyColor,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
  }
}

/*
Column(
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
                                padding:
                                    const EdgeInsets.only(left: 10, top: 7),
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
                                padding:
                                    const EdgeInsets.only(right: 10, top: 7),
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
                        itemCount: timeTable!.length.toInt(),
                        itemBuilder: (context, index) {
                          return Container(
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
                                                top: 0.0,
                                                left: 10.0,
                                                right: 5.0),
                                            child: CustomeTextStyle(
                                              text: 'Faculty Name:',
                                              size: 16,
                                              fontWeight: FontWeight.w500,
                                              color: GradientsColors
                                                  .blackRussianColor,
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
                                                    text:
                                                        arrMyMatchesList[index]
                                                                ['FacultyName']
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: GradientsColors
                                                          .melroseColor,
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
                                                top: 0.0,
                                                left: 10.0,
                                                right: 5.0),
                                            child: CustomeTextStyle(
                                              text: 'Subject:',
                                              size: 16,
                                              fontWeight: FontWeight.w500,
                                              color: GradientsColors
                                                  .blackRussianColor,
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
                                                    text:
                                                        arrMyMatchesList[index]
                                                                ['Subject']
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: GradientsColors
                                                          .melroseColor,
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
                                                top: 0.0,
                                                left: 10.0,
                                                right: 5.0),
                                            child: CustomeTextStyle(
                                              text: 'Time:',
                                              size: 16,
                                              fontWeight: FontWeight.w500,
                                              color: GradientsColors
                                                  .blackRussianColor,
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
                                                    text:
                                                        arrMyMatchesList[index]
                                                                ['Time']
                                                            .toString(),
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: GradientsColors
                                                          .melroseColor,
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
                                          arrMyMatchesList[index]['Note']
                                              .toString(),
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: GradientsColors.dollyColor,
                                      wordSpacing: 2,
                                    ),
                                  ),
                                )
                              ],
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
 */
