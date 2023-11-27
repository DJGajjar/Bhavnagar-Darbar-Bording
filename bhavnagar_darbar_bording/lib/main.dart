import 'package:flutter/material.dart';
import 'package:bhavnagar_darbar_bording/Controller/LoginController/LoginView.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bhavnagar_darbar_bording/Controller/TabController/TabBarView.dart';
import 'dart:async';
import 'package:bhavnagar_darbar_bording/Controller/LoginController/UserInfoView.dart';
import 'package:bhavnagar_darbar_bording/Extra/loading_overlay_alt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BhavnagarDarbarBording',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.white, //GradientsColors.blackRussianColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => SplashScreen();
}

class SplashScreen extends State<SplashView> {
  static const String USERLOGIN = "Login";
  static const String TOKEN = "Token";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
    // LoadingOverlayAlt(
    //   child: LoginViewController(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Feed/Cricket@3x.png'),
            fit: BoxFit.cover,
          ),
          // gradient: LinearGradient(
          //   begin: Alignment.bottomRight,`
          //   end: Alignment.centerRight,
          //   colors: <Color>[
          //     GradientsColors.blackRussianColor,
          //     GradientsColors.dollyColor,
          //   ],
          // ),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharePref = await SharedPreferences.getInstance();

    var isLogin = sharePref.getBool(USERLOGIN);

    Timer(
      Duration(seconds: 2),
      () {
        if (isLogin != null) {
          if (isLogin) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TabView(),
                  // builder: (context) => UserInfoView(),
                ));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginViewController(),
                ));
          }
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginViewController(),
              ));
        }
      },
    );
  }
}
