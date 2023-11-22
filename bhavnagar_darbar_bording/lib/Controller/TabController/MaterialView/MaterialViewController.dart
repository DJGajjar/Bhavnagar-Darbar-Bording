import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/rounded_button.dart';
import 'package:bhavnagar_darbar_bording/Controller/TabController/PaperView/PaperShowViewController.dart';

import '../../../Extra/Constant.dart';
import '../../../Model/Paper_Materials/Paper_MaterialsDetail.dart';
import '../../../main.dart';

class MaterialViewController extends StatefulWidget {
  const MaterialViewController({Key? key}) : super(key: key);

  @override
  State<MaterialViewController> createState() => _MaterialViewController();
}

class _MaterialViewController extends State<MaterialViewController> {
  bool isSelected = false;

  var isApiCAll = 'No';
  var isDataFound = 'No';

  int paperListCount = 0;
  int perPageCount = 0;

  List<Paper_MaterialsDetail>? paperMaterialList = <Paper_MaterialsDetail>[];

  List<Paper_MaterialsDetail>? paperMaterialStoreList =
      <Paper_MaterialsDetail>[];

  @override
  void initState() {
    print('API CAll State');

    isApiCAll = 'Yes';
    super.initState();

    getPaperDataList();
  }

  Future<void> getPaperDataList() async {
    print('CVlll aasmdas, a');

    var sharePref = await SharedPreferences.getInstance();
    var strToken = sharePref.getString(SplashScreen.TOKEN);
    print('Token : $strToken');

    print('Value API: ${BaseURL.materialsList + perPageCount.toString()}');
    try {
      Response response = await get(
        Uri.parse(BaseURL.materialsList + perPageCount.toString()),
        headers: {
          "Authorization": strToken.toString(),
        },
      );

      Map<String, dynamic> responseData = jsonDecode(response.body.toString());

      print('Response Data: ${responseData['status']}');

      if (responseData['status'] == 0) {
        print(
            'Display Alert Msg: ${Paper_MaterialsDetail.fromJson(responseData).message}');
        isApiCAll = 'No';
        setState(() => {});
      } else {
        var responseData = jsonDecode(response.body)['data']['materials'];
        print('Responce: ${responseData}');

        isDataFound = 'Yes';

        paperMaterialList = responseData
            .map((paperMaterialList) =>
                Paper_MaterialsDetail.fromJson(paperMaterialList))
            .toList()
            .cast<Paper_MaterialsDetail>();

        if (paperMaterialList?.length != 0) {
          paperMaterialStoreList?.addAll(paperMaterialList!);
          print('Product ADD : ${paperMaterialStoreList?.length}');
        }

        paperListCount = paperMaterialStoreList!.length.toInt();

        print('Paper ID: ${paperMaterialList?[0].id}');
        print('Papers List: ${paperMaterialList?[0].papers?.length.toInt()}');
        // print('Length OF Response: ${paperMaterialList?.length.toInt()}');

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
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.extentAfter == 0) {
                // User has reached the end of the list
                // Load more data or trigger pagination in flutter
                // _loadMoreData();
                perPageCount++;
                getPaperDataList();
                print('Scroll Will End');
              }
              return false;
            },
            child: isApiCAll == "Yes"
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                      backgroundColor: Colors.blue,
                    ),
                  )
                : isDataFound == 'No'
                    ? Center(
                        child: CustomeTextStyle(
                          text: 'Paper Data Not Found',
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: GradientsColors.melroseColor,
                          wordSpacing: 2,
                        ),
                      )
                    : ListView.separated(
                        itemCount: paperMaterialStoreList!.length.toInt(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: CustomeTextStyle(
                              text: paperMaterialStoreList![index]
                                  .subject_name
                                  .toString(),
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: GradientsColors.melroseColor,
                              wordSpacing: 2,
                            ),
                            subtitle: CustomeTextStyle(
                              text: paperMaterialStoreList![index]
                                  .created_on
                                  .toString(),
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
                                    builder: (context) =>
                                        PaperShowViewController()),
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
                      )));
  }
}
