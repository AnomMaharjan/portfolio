import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/constants/strings.dart';
import 'package:portfolio/core/widgets/bebas_neue_text.dart';

import '../../core/utils/text_scale_factor.dart';

class DesktopAboutScreen extends StatelessWidget {
  const DesktopAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: BebasneueText(
              text: "About Me",
              maxTextScaleFactor: 2,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            Strings.aboutMe,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w100,
              height: 1.5,
              wordSpacing: 1.5,
              color: Colors.white,
            ),
            textAlign: TextAlign.justify,
            textScaler: TextScaler.linear(
              ScaleSize.textScaleFactor(
                context,
                maxTextScaleFactor: 1.5,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.3),
            child: const Divider(
              thickness: 0.5,
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: BebasneueText(
                text: "What do I specialize on",
                maxTextScaleFactor: 2,
                fontSize: 24,
              )),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  "assets/flutter-icon.svg",
                  height: 80,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 120,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  "assets/nodejs-logo.svg",
                  height: 100,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 120,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  "assets/mongodb-icon.svg",
                  height: 100,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
