import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/text_scale_factor.dart';

class BebasneueText extends StatelessWidget {
  final String text;
  final double fontSize, maxTextScaleFactor;
  const BebasneueText(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.maxTextScaleFactor = 1.5});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.bebasNeue(
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        height: 1,
        color: Colors.white,
      ),
      textScaler: TextScaler.linear(
        ScaleSize.textScaleFactor(
          context,
          maxTextScaleFactor: maxTextScaleFactor,
        ),
      ),
    );
  }
}
