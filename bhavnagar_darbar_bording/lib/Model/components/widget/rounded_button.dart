import 'package:flutter/material.dart';
import 'package:bhavnagar_darbar_bording/Extra/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bhavnagar_darbar_bording/Controller/LoginController/LoginView.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton(
      {required this.btnName,
      this.btnIcon,
      this.btnBGColor = Colors.black,
      this.btnStyle,
      this.callback,
      Key? key})
      : super(key: key);

  final String btnName;
  final Icon? btnIcon;
  final Color? btnBGColor;
  final TextStyle? btnStyle;
  final VoidCallback? callback;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 16,
      color: GradientsColors.dollyColor,
      shadowColor: GradientsColors.blackRussianColor,
      child: widget.btnName == 'Login'
          ? Expanded(
              child: ElevatedButton(
                onPressed: () {
                  widget.callback!();
                },
                child: Text(
                  widget.btnName,
                  style: widget.btnStyle,
                  textAlign: TextAlign.end,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.btnBGColor,
                  shadowColor: widget.btnBGColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ).px(12).py(2.5),
            )
          : Expanded(
              child: ElevatedButton(
                onPressed: () {
                  widget.callback!();
                },
                child: CircularProgressIndicator(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.btnBGColor,
                  shadowColor: widget.btnBGColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ).px(12).py(2.5),
            ),
    );
  }
}
