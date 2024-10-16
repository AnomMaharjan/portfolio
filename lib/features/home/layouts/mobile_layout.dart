import 'package:flutter/material.dart';
import 'package:portfolio/features/about/mobile_about_screen.dart';
import 'package:portfolio/features/landing/mobile_landing_screen.dart';

import '../home_screen.dart';

class MobileLayout extends StatelessWidget {
  final GlobalKey landingKey, aboutKey, workKey, experienceKey;
  const MobileLayout({
    super.key,
    required this.aboutKey,
    required this.experienceKey,
    required this.landingKey,
    required this.workKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MobileLandingScreen(key: landingKey),
        const CustomDivider(
          paddingWidth: 20,
        ), // Assign key to section
        MobileAboutScreen(key: aboutKey),
        const CustomDivider(
          paddingWidth: 20,
        ), // Assign key to section
        // MobileExperience(
        //   key: experienceKey,
        // ),
        // const CustomDivider(),
        // MobileWorksScreen(
        //   key: workKey,
        // ),
        // const CustomDivider(),

        // const MobileFooter()
        // Assign key to section
      ],
    );
  }
}
