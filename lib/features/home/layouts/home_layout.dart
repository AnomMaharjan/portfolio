import 'package:flutter/material.dart';

import '../../../core/widgets/footer/desktop_footer.dart';
import '../../about/desktop_about_screen.dart';
import '../../experience/desktop_experience.dart';
import '../../landing/desktop_landing_screen.dart';
import '../../works/desktop_works_screen.dart';
import '../home_screen.dart';

class HomeLayout extends StatelessWidget {
  final GlobalKey landingKey, aboutKey, workKey, experienceKey;
  const HomeLayout({
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
        DesktopLandingScreen(key: landingKey),
        const CustomDivider(), // Assign key to section
        DesktopAboutScreen(key: aboutKey),
        const CustomDivider(), // Assign key to section
        // LinksScreen(key: _linksKey),
        DesktopExperience(
          key: experienceKey,
        ),
        const CustomDivider(),
        DesktopWorksScreen(
          key: workKey,
        ),
        const CustomDivider(),

        const DesktopFooter()
        // Assign key to section
      ],
    );
  }
}
