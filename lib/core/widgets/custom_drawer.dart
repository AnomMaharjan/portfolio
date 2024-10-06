import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: const Size.fromHeight(kToolbarHeight).height),
      child: Drawer(
        child: Container(
          child: const Column(
            children: [
              Text("Home"),
              Text("Profile"),
              Text("Portfolio"),
              Text("About Me"),
              Text("Contact")
            ],
          ),
        ),
      ),
    );
  }
}
