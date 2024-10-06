import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/text_scale_factor.dart';
import 'package:portfolio/core/widgets/typewriter_text.dart';
import 'package:portfolio/features/landing/widgets/slide_widget.dart';

class MobileAboutScreen extends StatelessWidget {
  const MobileAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Hi,",
            style: GoogleFonts.bebasNeue(
                fontWeight: FontWeight.w100, height: 1, color: Colors.white),
            textScaler: TextScaler.linear(
                ScaleSize.textScaleFactor(context, maxTextScaleFactor: 6)),
          ),
          Text(
            "I'm a",
            style: GoogleFonts.bebasNeue(
                fontSize: 60,
                fontWeight: FontWeight.w100,
                height: 1,
                color: Colors.white),
          ),
          const TypewriterText(
            texts: ["Software Developer.", "Freelancer."],
            textSize: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Flutter developer with 3+ years of experience crafting high-quality, cross-platform mobile apps for Android and iOS. Proficient in Dart, state management (Bloc, Provider), API integration, and creating intuitive UI/UX designs. Known for writing clean, efficient code and collaborating effectively with teams to deliver user-focused solutions. Passionate about utilizing cutting-edge technologies to build seamless, visually engaging mobile experiences.",
            style: GoogleFonts.bebasNeue(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                height: 1,
                color: Colors.white),
          ),
          Center(
            child: SlideWidget(
              width: MediaQuery.of(context).size.width * 0.65,
            ),
          )
        ],
      ),
    );
  }
}
