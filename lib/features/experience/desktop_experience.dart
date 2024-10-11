import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/widgets/bebas_neue_text.dart';
import '../../core/utils/text_scale_factor.dart';
import 'dart:html' as html;

class DesktopExperience extends StatelessWidget {
  const DesktopExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: BebasneueText(
                  text: "My Experiences",
                  fontSize: 30,
                  maxTextScaleFactor: 1.5,
                ),
              ),
              const ExperienceCard(
                isRightSide: true,
                role: "ICT Instructor",
                company: "Bodhi Briksha Elementary School",
                description:
                    "Instructed primary school students in basic computer skills, coding fundamentals, and digital literacy. Designed engaging lessons and hands-on activities to introduce students to technology, including topics like typing, internet safety, and simple programming using tools like Scratch and Pictoblox. Worked closely with teachers to integrate ICT into the broader curriculum, fostering a tech-friendly learning environment.",
                endYear: "Present",
                startYear: "June 2024",
                keyContributions: [
                  "Taught students essential computer skills and introductory coding concepts.",
                  "Developed creative projects to enhance learning through technology.",
                  "Promoted digital safety and responsible internet use among young learners."
                ],
              ),
              const ExperienceCard(
                  role: "Flutter Developer",
                  isRightSide: false,
                  company: "Freelancing",
                  description:
                      "Worked independently on diverse mobile app projects for clients, delivering high-quality, cross-platform applications using Flutter. Specializing in building intuitive UI/UX, integrating RESTful APIs, and optimizing app performance. Collaborated with clients to gather requirements, provide technical guidance, and ensure timely delivery of custom solutions for both iOS and Android.",
                  keyContributions: [
                    "Delivered feature-rich mobile apps for multiple industries, including e-commerce, health, and finance.",
                    "Implemented responsive designs and state management using BLoC and Provider.",
                    "Enhanced app performance and reduced bugs through testing and optimization."
                  ],
                  endYear: "Present",
                  startYear: "April 2021"),
              const ExperienceCard(
                role: "Flutter Developer",
                isRightSide: true,
                company: "Prixa Technologies",
                description:
                    "Began as a Flutter development intern, quickly transitioning into a full-time role after demonstrating a strong understanding of mobile app development and UI/UX design. Over the past three years, I have contributed to the development of several cross-platform applications, focusing on performance optimization, state management using BLoC, GetX and Provider, and seamless API integrations.",
                endYear: "Nov 2022",
                startYear: "Dec 2020",
                keyContributions: [
                  "Built and maintained highly interactive mobile applications across iOS and Android platforms.",
                  "Implemented modern architecture patterns such as BLoC and Provider for state management.",
                  "Mentored junior developers and reviewed code to ensure high-quality, maintainable codebases."
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: MaterialButton(
                  color: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  minWidth: 200,
                  onPressed: () {
                    html.window
                        .open("assets/anom_resume.pdf", "anom_resume.pdf");
                  },
                  child: Text(
                    "Download Resume",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String company, startYear, endYear, description, role;
  final List<String> keyContributions;
  final bool isRightSide;
  const ExperienceCard(
      {super.key,
      required this.role,
      required this.isRightSide,
      required this.company,
      required this.description,
      this.keyContributions = const [],
      required this.endYear,
      required this.startYear});

  @override
  Widget build(BuildContext context) {
    return isRightSide
        ? Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(
                            context,
                            maxTextScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        company,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(
                            context,
                            maxTextScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      Text(
                        "$startYear - $endYear",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(
                            context,
                            maxTextScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          description,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(
                              context,
                              maxTextScaleFactor: 1.5,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Key Contributions:",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(
                            context,
                            maxTextScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...keyContributions.map(
                            (element) => Text(
                              "\u2022 $element",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                              textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(
                                  context,
                                  maxTextScaleFactor: 1.5,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          )
        : Row(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(
                            context,
                            maxTextScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        company,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(
                            context,
                            maxTextScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      Text(
                        "$startYear - $endYear",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(
                            context,
                            maxTextScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          description,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(
                              context,
                              maxTextScaleFactor: 1.5,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Key Contributions:",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(
                            context,
                            maxTextScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...keyContributions.map(
                            (element) => Text(
                              "\u2022 $element",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(
                                  context,
                                  maxTextScaleFactor: 1.5,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(),
            ],
          );
  }
}
