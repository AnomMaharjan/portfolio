import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/text_scale_factor.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40),
          key: key,
          child: Text(
            "Get connected with me",
            style: GoogleFonts.bebasNeue(
              color: Colors.white,
              fontSize: 40,
            ),
            textScaler: TextScaler.linear(
              ScaleSize.textScaleFactor(
                context,
                maxTextScaleFactor: 1.25,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),        Row(
          children: [
            Text(
              "LinkedIn",
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text(
              "Facebook",
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text(
              "Instagram",
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 40,
              ),
            )
          ],
        )
      ],
    );
  }
}
