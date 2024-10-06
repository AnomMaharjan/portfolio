import 'package:flutter/material.dart';

class DesktopExperience extends StatelessWidget {
  const DesktopExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ExperienceCard(company: "Prixa Technologies", description: "", endYear: "Nov 2022", startYear: "Dec 2020"),
        ExperienceCard(company: "Freelancing", description: "", endYear: "Present", startYear: "April 2022"),

      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String company, startYear, endYear, description;
  const ExperienceCard(
      {super.key,
      required this.company,
      required this.description,
      required this.endYear,
      required this.startYear});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(company),
        Row(
          children: [
            Text("$startYear - "),
            Text(endYear),
          ],
        ),
        Text(description)
      ],
    );
  }
}
