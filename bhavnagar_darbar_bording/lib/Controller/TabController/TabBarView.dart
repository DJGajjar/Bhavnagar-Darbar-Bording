import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:bhavnagar_darbar_bording/Controller/TabController/ClubView/ClubViewController.dart';
// import 'package:bhavnagar_darbar_bording/Controller/TabController/ClubView/CreateClubViewController.dart';
import 'package:bhavnagar_darbar_bording/Controller/TabController/HomeView/HomeController.dart';
// import 'package:bhavnagar_darbar_bording/Controller/TabController/LeagueView/LeagueFormsViewController.dart';
// import 'package:bhavnagar_darbar_bording/Controller/TabController/LeagueView/LeagueViewController.dart';
// import 'package:bhavnagar_darbar_bording/Controller/TabController/MyMatchesView/CreateMatchViewController.dart';
// import 'package:bhavnagar_darbar_bording/Controller/TabController/MyMatchesView/MatchesViewController.dart';
// import 'package:bhavnagar_darbar_bording/Controller/TabController/SettingView/SettingViewController.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:bhavnagar_darbar_bording/Model/components/widget/textstyle.dart';
import 'package:velocity_x/velocity_x.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int _selectedIndex = 0;
  bool isAction = false;

  String navTitle = 'Feed';
  String actionTitle = '';

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeViewController(),
    // LeagueViewController(),
    // ClubViewController(),
    // MyMatchesViewController(),
    // SettingViewController(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            navTitle = 'Feed';
            isAction = false;
            actionTitle = '';
          }
          break;
        case 1:
          {
            navTitle = 'League';
            isAction = true;
            actionTitle = 'Create League';
          }
          break;
        case 2:
          {
            navTitle = 'Club';
            isAction = true;
            actionTitle = 'Create Club';
          }
          break;
        case 3:
          {
            navTitle = 'Matches';
            isAction = true;
            actionTitle = 'Create Match';
          }
          break;
        case 4:
          {
            navTitle = 'Setting';
            isAction = false;
            actionTitle = '';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        shadowColor: GradientsColors.melroseColor,
        automaticallyImplyLeading: false,
        actions: isAction == true
            ? [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GradientsColors.blackRussianColor,
                    foregroundColor: GradientsColors.dollyColor,
                    elevation: 10,
                    alignment: Alignment.center,
                    shadowColor: GradientsColors.melroseColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () {
                    print('Click Club');
                    if (actionTitle == 'Create League') {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TournamentFormsViewController()));*/
                    } else if (actionTitle == 'Create Club') {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CreateClubViewController()),
                      );*/
                    } else if (actionTitle == 'Create Match') {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CreateMatchViewController()),
                      );*/
                    } else {}
                  },
                  child: CustomeTextStyle(
                    text: actionTitle,
                    size: 14,
                    fontWeight: FontWeight.w600,
                    color: GradientsColors.melroseColor,
                    wordSpacing: 2,
                  ),
                ).px(12).py(5.5),
              ]
            : [],
        title: CustomeTextStyle(
          text: navTitle,
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
      body: Center(
        //child: _widgetOptions.elementAt(_selectedIndex),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: GradientsColors.melroseColor,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 10,
          elevation: 10,
          selectedIconTheme: IconThemeData(
            color: GradientsColors.melroseColor,
            size: 22,
          ),
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          unselectedIconTheme: IconThemeData(
            color: GradientsColors.dollyColor,
          ),
          unselectedItemColor: GradientsColors.dollyColor,

          type: BottomNavigationBarType.fixed,
          backgroundColor: GradientsColors.blackRussianColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'League',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Club',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.padding_rounded),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_sharp),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          //selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
