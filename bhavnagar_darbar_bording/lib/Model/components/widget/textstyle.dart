import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeTextStyle extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final VoidCallback? onClick;
  final TextAlign? textAlign;

  const CustomeTextStyle({
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.onClick,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onClick == null
          ? Text(
              text,
              textDirection: TextDirection.ltr,
              style: GoogleFonts.poppins(
                fontSize: size,
                fontWeight: fontWeight,
                color: color,
                wordSpacing: wordSpacing,
              ),
              textAlign: textAlign,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          : TextButton(
              onPressed: () {
                onClick?.call();
              },
              child: Text(
                text,
                textDirection: TextDirection.ltr,
                style: GoogleFonts.poppins(
                  fontSize: size,
                  fontWeight: fontWeight,
                  color: color,
                  wordSpacing: wordSpacing,
                ),
                textAlign: textAlign,
              ),
            ),
    );
  }
}
