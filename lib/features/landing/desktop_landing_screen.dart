import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/text_scale_factor.dart';
import '../../core/widgets/typewriter_text.dart';
import 'widgets/slide_widget.dart';

class DesktopLandingScreen extends StatelessWidget {
  const DesktopLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      key: key,
      padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: size.height * 0.075),
      width: double.infinity,
      // height: size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I'm a",
                style: GoogleFonts.bebasNeue(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  height: 1,
                  color: Colors.white,
                ),
                textScaler: TextScaler.linear(
                  ScaleSize.textScaleFactor(
                    context,
                    maxTextScaleFactor: 6,
                  ),
                ),
              ),
              const TypewriterText(
                texts: ["Software Developer.", "Freelancer."],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          SlideWidget(
            width: 300,
            height: size.height < 700 ? 600 : size.height * 0.8,
          ),
        ],
      ),
    );
  }
}
