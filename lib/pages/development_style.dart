import 'package:flutter/material.dart';

import '../models/asset_with_text.dart';
import '../models/content.dart';
import '../models/equpment.dart';
import '../tools/constants.dart';
import '../widgets/asset_detailed.dart';
import '../widgets/asset_header.dart';
import '../widgets/asset_title.dart';

import '../widgets/content_aligner.dart';
import '../widgets/text_header.dart';

///
class DevelopmentStyle extends StatefulWidget {
  ///
  DevelopmentStyle({Key? key}) : super(key: key);

  @override
  State<DevelopmentStyle> createState() => _DevelopmentStyleState();
}

class _DevelopmentStyleState extends State<DevelopmentStyle> {
  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> contentFtr = Content().getTextContent();

  final List<Equipment> _equipments = [
    Equipment(
        svgPath: "assets/icons/macbook.svg",
        content: "Macbook Pro 14''",
        title: "Computer"),
    Equipment(
        svgPath: "assets/icons/screen.svg",
        content: "AOC 23.8” IPS SLIM",
        title: "Screen"),
    Equipment(
        svgPath: "assets/icons/keyboard.svg",
        content: "Apple Magic Keyb.",
        title: "Keyboard"),
    Equipment(
        svgPath: "assets/icons/mouse.svg",
        content: "Apple Magic Mouse",
        title: "Mause"),
    Equipment(
        svgPath: "assets/icons/ios.svg",
        content: "iPhone 11",
        title: "Ios Device"),
    Equipment(
        svgPath: "assets/icons/android.svg",
        content: "Honor Magic 2",
        title: "Android Device"),
    Equipment(
        svgPath: "assets/icons/mug.svg",
        content: "Contigo Luxe ",
        title: "Coffee Mug"),
    Equipment(
        svgPath: "assets/icons/bag.svg",
        content: "Peak D.Everyday",
        title: "Mobile Bag"),
  ];

  final List<AssetWithTitleOrHeader> _suitableOffice = [
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/stop.svg", title: "No Need Office Equipment"),
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/shift.svg", title: "Suitable Shift Periods"),
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/social.svg",
        title: " Fast Social Compatibility"),
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/office.svg", title: "Suitable  Office Location"),
  ];

  final List<AssetWithTitleOrHeader> _suitableRemote = [
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/clickup.svg", title: "Clickup"),
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/online_meeting.svg", title: "Meeting Apps"),
    AssetWithTitleOrHeader(svgPath: "assets/icons/github.svg", title: "Github"),
    AssetWithTitleOrHeader(svgPath: "assets/icons/notion.svg", title: "Notion"),
    AssetWithTitleOrHeader(svgPath: "assets/icons/slack.svg", title: "Slack"),
    AssetWithTitleOrHeader(svgPath: "assets/icons/trello.svg", title: "Trello"),
  ];

  @override
  Widget build(BuildContext context) {
    Widget result = ConstrainedBox(
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
                    //? HEADER
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeader(
                              headline: "Development Style",
                              subline: "Remote or Office, It Doesn't Matter"),
                          smallSpace,
                          Text(
                            content.data!["about_me"],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          largeSpace,
                          AssetHeader(
                            svgPath: "assets/icons/remote.svg",
                            title: "Remote Work",
                          ),
                          smallSpace,
                          Text(
                            content.data!["about_me"],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          smallSpace,
                          AssetTitle(
                              svgPath: "assets/icons/run_hours.svg",
                              title: "Minimum 4 hours pomodoro run per day"),
                          largeSpace,
                          Text(
                            "Suitable With",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          smallSpace,
                          ContentAligner<AssetWithTitleOrHeader>(
                              space: mediumSpace,
                              builder: (s) {
                                return AssetTitle(
                                    svgPath: s.svgPath, title: s.title);
                              },
                              contents: _suitableRemote),
                          largeSpace,
                          AssetHeader(
                            svgPath: "assets/icons/remote.svg",
                            title: "Office Work",
                          ),
                          smallSpace,
                          Text(
                            content.data!["about_me"],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          largeSpace,
                          Text(
                            "Suitable With",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          mediumSpace,
                          ContentAligner<AssetWithTitleOrHeader>(
                              space: mediumSpace,
                              builder: (s) => AssetTitle(
                                  svgPath: s.svgPath, title: s.title),
                              contents: _suitableOffice),
                          largeSpace,
                          AssetHeader(
                            svgPath: "assets/icons/magic.svg",
                            title: "Developer Equipment",
                          ),
                          mediumSpace,
                          ContentAligner<Equipment>(
                              builder: (eq) => AssetDetailed(
                                  svgPath: eq.svgPath,
                                  content: eq.content,
                                  title: eq.title),
                              contents: _equipments),
                        ],
                      ),
                    )
                  ],
                );
              }
            }),
      ),
    );

    if (MediaQuery.of(context).size.width < 250) {
      result = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: result,
      );
    }

    return Scaffold(
      backgroundColor: const Color(0XFF1D1F20),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: result,
        ),
      ),
    );
  }
}
