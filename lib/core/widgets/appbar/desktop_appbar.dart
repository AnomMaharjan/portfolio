import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final GlobalKey aboutKey;
  final GlobalKey worksKey;
  final GlobalKey experienceKey;
  final GlobalKey landingKey;

  // final ScrollController scrollController;

  const DesktopAppbar(
      {super.key,
      this.backgroundColor = const Color.fromARGB(255, 29, 36, 41),
      required this.aboutKey,
      required this.experienceKey,
      required this.worksKey,
      required this.landingKey
      // required this.scrollController,
      });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      titleSpacing:
          0, // Ensures that the Row spans the full width of the AppBar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side content

          GestureDetector(
            onTap: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Scrollable.ensureVisible(aboutKey.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Anom Maharjan",
                style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 24),
              ),
            ),
          ),

          // Center menu items
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarItems(menuTitle: "Home", globalKey: landingKey),
              AppBarItems(menuTitle: "About", globalKey: aboutKey),
              AppBarItems(menuTitle: "Experience", globalKey: experienceKey),
              AppBarItems(menuTitle: "Works", globalKey: worksKey),
            ],
          ),

          // Right side content
          const MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                "Contact",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarItems extends StatelessWidget {
  final String menuTitle;
  final GlobalKey globalKey;

  const AppBarItems({
    super.key,
    required this.menuTitle,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scrollable.ensureVisible(globalKey.currentContext!,
                duration: const Duration(seconds: 1), curve: Curves.decelerate);
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            menuTitle,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
