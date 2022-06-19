import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../cards/app_card.dart';
import '../models/app.dart';
import '../models/content.dart';

import '../tools/constants.dart';

import '../widgets/text_header.dart';

///
class DoneProjects extends StatefulWidget {
  ///
  DoneProjects({Key? key}) : super(key: key);

  @override
  State<DoneProjects> createState() => _DoneProjectsState();
}

class _DoneProjectsState extends State<DoneProjects> {
  final List<App> appList = [
    App(
        appName: "Turla",
        assetPath: "assets/images/turla.png",
        appId: "turla",
        appExp: "turla_exp",
        marketLink: [
          Uri(
              scheme: 'https',
              host: 'www.play.google.com',
              path: 'store/apps/details?id=com.turla/'),
        ]),
    App(
        appName: "Developer App",
        assetPath: "assets/images/dev_resume.png",
        appId: "turla",
        appExp: "resume_exp",
        marketLink: [
          Uri(),
          Uri(),
          Uri(
              scheme: 'https',
              host: 'www.github.com',
              path: 'kubilaydev/developer_resume/'),
        ]),
    App(
        appName: "Şive App",
        assetPath: "assets/images/accent.jpg",
        appId: "sive",
        appExp: "sive_exp",
        marketLink: []),
    App(
        appName: "Solion Battery App",
        assetPath: "assets/images/solion.png",
        appId: "solion",
        appExp: "solion_exp",
        marketLink: [
          Uri(
              scheme: 'https',
              host: 'www.play.google.com',
              path: 'store/apps/details?id=solion.battery_data_indicator/'),
        ]),
  ];

  late Future<Map<String, dynamic>> contentFtr = Content().getTextContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1D1F20),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeader(
                            headline: "done_projects", subline: "mosty_entre"),
                        smallSpace,
                        Text(
                          "done_exp",
                          style: Theme.of(context).textTheme.bodyText1,
                        ).tr(),
                        largeSpace,
                        for (var app in appList)
                          AppCard(
                            app: app,
                          ),
                      ],
                    ),
                  )
                ],
              ))),
        ),
      ),
    );
  }
}
