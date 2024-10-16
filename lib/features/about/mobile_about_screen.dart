import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/strings.dart';
import 'package:portfolio/core/widgets/bebas_neue_text.dart';

class MobileAboutScreen extends StatelessWidget {
  const MobileAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const BebasneueText(
            text: "About Me",
            fontSize: 40,
            maxTextScaleFactor: 2,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            Strings.aboutMe,
            style: GoogleFonts.bebasNeue(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                height: 1,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
