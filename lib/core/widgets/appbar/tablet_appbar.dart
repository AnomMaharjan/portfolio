import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabletAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;

  const TabletAppbar({
    super.key,
    this.backgroundColor = const Color.fromARGB(255, 29, 36, 41),
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Anom Maharjan",
              style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 24),
            ),
          ),

          // Center menu items
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Works",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Experience",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Links",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),

          // Right side content
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              "Contact",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
