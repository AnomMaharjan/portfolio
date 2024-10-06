import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileAppbar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Color backgroundColor;

  const MobileAppbar(
      {super.key,
      required this.scaffoldKey,
      this.backgroundColor = const Color.fromARGB(255, 29, 36, 41),
      s});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(
        "Anom Maharjan",
        style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 24),
      ),
      actions: [
        GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
