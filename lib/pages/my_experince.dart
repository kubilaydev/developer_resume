import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../cards/experience_card.dart';

import '../models/experience.dart';
import '../tools/constants.dart';

import '../widgets/text_header.dart';

///
class MyExperience extends StatefulWidget {
  ///
  MyExperience({Key? key}) : super(key: key);

  @override
  State<MyExperience> createState() => _MyExperienceState();
}

class _MyExperienceState extends State<MyExperience> {
  List<Experience> experienceList = [
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Turla App",
      content: "turla_content",
      location: "Istanbul /Remote",
      date: "Currently",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Şive App",
      content: "sive_content",
      location: "Istanbul /Remote",
      date: "Dec 2021",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Anko Energy",
      content: "anko_content",
      location: "Istanbul /Remote",
      date: "Jul 2021",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Insta Match",
      content: "insta_content",
      location: "Antalya /Remote",
      date: "Nov 2021",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Nestek/ Co-Founder",
      content: "nestek_content",
      location: "Antalya / Teknopark",
      date: "Feb 2021",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Flightmax/ Co-Founder",
      content: "flightmax_content",
      location: "Silicon Valley, San Francisco",
      date: "Oct 2019",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Battery Assist/ Co-Founder",
      content: "batter_content",
      location: "İstanbul / ITU Çekirdek",
      date: "Oct 2019",
    ),
    Experience(
      svgIconPath: "assets/icons/flutter_active.svg",
      title: "Shell Eco-marathon",
      content: "eco_content",
      location: "London, United Kingdom",
      date: "May 2017",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1D1F20),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHeader(headline: "my_experience", subline: "dev_entre"),
                  smallSpace,
                  Text(
                    "experience_exp",
                    style: Theme.of(context).textTheme.bodyText1,
                  ).tr(),
                  largeSpace,
                  for (var experience in experienceList)

                    /// EXPERIENCE CARD
                    ExperienceCard(
                      svgIconPath: experience.svgIconPath,
                      title: experience.title,
                      content: experience.content,
                      date: experience.date,
                      location: experience.location,
                    ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
