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
        appName: "Şive App1",
        assetPath: "assets/images/accent.jpg",
        appId: "sive"),
    App(
        appName: "Şive App2",
        assetPath: "assets/images/accent.jpg",
        appId: "sive"),
    App(
        appName: "Şive App3",
        assetPath: "assets/images/accent.jpg",
        appId: "sive"),
    App(
        appName: "Şive App4",
        assetPath: "assets/images/accent.jpg",
        appId: "sive")
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
              child: FutureBuilder<Map<String, dynamic>>(
                  future: contentFtr,
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
                                    headline: "Done Projects",
                                    subline:
                                        "Mostly Entrepreneurial Developer"),
                                smallSpace,
                                Text(
                                  content.data!["my_experience"],
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                largeSpace,
                                for (var app in appList)
                                  AppCard(
                                    app: app,
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
        ),
      ),
    );
  }
}
