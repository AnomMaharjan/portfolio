import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/widgets/bebas_neue_text.dart';
import 'dart:js' as js;

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FooterIcon(
                isSvg: true,
                height: 50,
                imageSrc: "assets/fb.svg",
                url: "https://www.facebook.com/anom.mzn"),
            SizedBox(
              width: 20,
            ),
            FooterIcon(
                imageSrc: "assets/insta.png",
                height: 30,
                url: "https://www.instagram.com/anomaharjan/"),
            SizedBox(
              width: 20,
            ),
            FooterIcon(
              imageSrc: "assets/linkedin.png",
              height: 30,
              url: "https://www.linkedin.com/in/anom-maharjan/",
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40.0, top: 20),
          child: BebasneueText(
            text: "All rights reserved \u00A92024",
            fontSize: 14,
            maxTextScaleFactor: 1.5,
          ),
        ),
      ],
    );
  }
}

class FooterIcon extends StatelessWidget {
  final bool isSvg;
  final double height;
  final String imageSrc, url;
  const FooterIcon({
    super.key,
    this.isSvg = false,
    this.height = 30,
    required this.imageSrc,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          js.context.callMethod('open', [url]);
        },
        child: isSvg
            ? SvgPicture.asset(
                imageSrc,
                height: height,
              )
            : Image.asset(
                imageSrc,
                height: height,
              ),
      ),
    );
  }
}
