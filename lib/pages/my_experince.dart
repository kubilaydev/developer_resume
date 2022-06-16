import 'package:flutter/material.dart';

import '../models/content.dart';
import '../models/experience.dart';
import '../tools/constants.dart';

import '../widgets/experience_card.dart';

import '../widgets/text_header.dart';

///
class MyExperience extends StatefulWidget {
  ///
  MyExperience({Key? key}) : super(key: key);

  @override
  State<MyExperience> createState() => _MyExperienceState();
}

class _MyExperienceState extends State<MyExperience> {
  @override
  void initState() {
    super.initState();
  }

  List<Experience> experienceList = [
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Title",
      content: "my_experience",
      location: "Istanbul",
      date: "12 Jul 2021",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Title",
      content: "my_experience",
      location: "Istanbul",
      date: "12 Jul 2021",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Title",
      content: "my_experience",
      location: "Istanbul",
      date: "12 Jul 2021",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1D1F20),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>>(
              future: Content().getTextContent(),
              builder: (context, content) {
                if (content.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextHeader(
                                headline: "My Experience",
                                subline:
                                    "3 years entrepreneur & 3 years in coding"),
                            smallSpace,
                            Text(
                              content.data!["my_experience"],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            largeSpace,
                            for (var experience in experienceList)

                              /// EXPERIENCE CARD
                              ExperienceCard(
                                svgIconPath: experience.svgIconPath,
                                title: experience.title,
                                content: content.data!["${experience.content}"],
                                date: experience.date,
                                location: experience.location,
                              ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
