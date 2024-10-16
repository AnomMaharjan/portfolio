import 'package:flutter/material.dart';
import 'package:portfolio/features/landing/widgets/slide_widget.dart';
import '../../core/widgets/bebas_neue_text.dart';
import '../../core/widgets/typewriter_text.dart';

class MobileLandingScreen extends StatelessWidget {
  const MobileLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          const Size.fromHeight(kToolbarHeight).height,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SlideWidget(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.725,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const BebasneueText(
              text: "Hi,",
              maxTextScaleFactor: 2,
              fontSize: 40,
            ),
            const BebasneueText(
              text: "I'm a",
              maxTextScaleFactor: 2,
              fontSize: 40,
            ),
            const TypewriterText(
              texts: ["Software Developer.", "Freelancer."],
              textSize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
