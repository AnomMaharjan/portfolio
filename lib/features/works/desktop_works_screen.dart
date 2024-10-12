import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import '../../core/utils/text_scale_factor.dart';

class DesktopWorksScreen extends StatelessWidget {
  const DesktopWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30),
          key: key,
          child: Text(
            "Check Out My Works",
            style: GoogleFonts.bebasNeue(
              color: Colors.white,
              fontSize: 30,
            ),
            textScaler: TextScaler.linear(
              ScaleSize.textScaleFactor(
                context,
                maxTextScaleFactor: 1.35,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WorkCard(
                description:
                    "NCC app brings you to the country's senior consultant interventional cardiologist Dr Om Murthy Anil.",
                imagePath: "assets/ncc.jpeg",
                projectName: "National Cardiac Center",
                projectLink:
                    "https://play.google.com/store/apps/details?id=org.prixa.ncc&hl=ne",
              ),
              WorkCard(
                description:
                    "A mobile app for Hospital and Rehabilitation for Disabled Children (a hospital in Banepa).",
                imagePath: "assets/hrdc.jpeg",
                projectName: "HRDC",
                projectLink:
                    "https://apps.apple.com/us/app/hrdc-disability-prevention/id6475731199",
              ),
              WorkCard(
                description:
                    "PTC Nepal is Nepal's first medical consultation service operated by a D-U-N-S registered business and verified from the directory of the Nepal medical council (NMC).",
                imagePath: "assets/ptc.jpeg",
                projectName: "PTC Nepal",
                projectLink:
                    "https://apps.apple.com/us/app/ptc-nepal/id1660435059",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}

class WorkCard extends StatelessWidget {
  final String projectName, description, imagePath, projectLink;
  const WorkCard(
      {super.key,
      required this.description,
      required this.imagePath,
      required this.projectLink,
      required this.projectName});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          js.context.callMethod('open', [projectLink]);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.asset(
                  imagePath,
                  width: 300,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  projectName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(
                      context,
                      maxTextScaleFactor: 1.35,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Divider(
                  height: 0.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(
                      context,
                      maxTextScaleFactor: 1.35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
