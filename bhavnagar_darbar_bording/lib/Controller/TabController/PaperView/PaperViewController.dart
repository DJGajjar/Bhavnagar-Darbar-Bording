import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class PaperViewController extends StatelessWidget {
  const PaperViewController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.lightGreenAccent,
        border: Border.all(
          color: Colors.blue,
          width: 10,
        ),
      ),
    );
  }
}
