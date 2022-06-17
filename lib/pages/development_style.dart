import 'package:flutter/material.dart';

import '../models/content.dart';
import '../tools/constants.dart';
import '../widgets/asset_detailed.dart';
import '../widgets/asset_header.dart';
import '../widgets/asset_title.dart';

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

  @override
  Widget build(BuildContext context) {
    /// Size of page
    var size = MediaQuery.of(context).size;
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
                            Row(
                              children: [
                                AssetTitle(
                                    svgPath: "assets/icons/run_hours.svg",
                                    title:
                                        "Minimum 4 hours pomodoro run per day"),
                              ],
                            ),
                            largeSpace,
                            Text(
                              "Suitable With",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            smallSpace,
                            Row(
                              children: [
                                AssetTitle(
                                    svgPath: "assets/icons/clickup.svg",
                                    title: "Clickup"),
                                horizontalLargeSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/online_meeting.svg",
                                    title: "Any Meeting App"),
                              ],
                            ),
                            mediumSpace,
                            Row(
                              children: [
                                AssetTitle(
                                    svgPath: "assets/icons/github.svg",
                                    title: "Github"),
                                horizontalLargeSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/notion.svg",
                                    title: "Notion"),
                              ],
                            ),
                            mediumSpace,
                            Row(
                              children: [
                                AssetTitle(
                                    svgPath: "assets/icons/slack.svg",
                                    title: "Slack"),
                                horizontalLargeSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/trello.svg",
                                    title: "Trello"),
                              ],
                            ),
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
                            Row(
                              children: [
                                AssetTitle(
                                    svgPath: "assets/icons/stop.svg",
                                    title: "No Need Office Equipment"),
                                horizontalLargeSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/shift.svg",
                                    title: "Suitable Shift Periods"),
                              ],
                            ),
                            mediumSpace,
                            Row(
                              children: [
                                AssetTitle(
                                    svgPath: "assets/icons/social.svg",
                                    title: " Fast Social Compatibility"),
                                horizontalLargeSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/office.svg",
                                    title: "Suitable  Office Location"),
                              ],
                            ),
                            largeSpace,
                            AssetHeader(
                              svgPath: "assets/icons/magic.svg",
                              title: "Developer Equipment",
                            ),
                            mediumSpace,
                            Row(
                              children: [
                                AssetDetailed(
                                    svgPath: "assets/icons/macbook.svg",
                                    content: "Macbook Pro 14''",
                                    title: "Computer"),
                                horizontalLargeSpace,
                                AssetDetailed(
                                    svgPath: "assets/icons/screen.svg",
                                    content: "AOC 23.8” IPS SLIM",
                                    title: "Screen"),
                              ],
                            ),
                            smallSpace,
                            Row(
                              children: [
                                AssetDetailed(
                                    svgPath: "assets/icons/keyboard.svg",
                                    content: "Apple Magic Keyb.",
                                    title: "Keyboard"),
                                horizontalLargeSpace,
                                AssetDetailed(
                                    svgPath: "assets/icons/mouse.svg",
                                    content: "Apple Magic Mouse",
                                    title: "Mause"),
                              ],
                            ),
                            smallSpace,
                            Row(
                              children: [
                                AssetDetailed(
                                    svgPath: "assets/icons/ios.svg",
                                    content: "iPhone 11",
                                    title: "Ios Device"),
                                horizontalLargeSpace,
                                AssetDetailed(
                                    svgPath: "assets/icons/android.svg",
                                    content: "Honor Magic 2",
                                    title: "Android Device"),
                              ],
                            ),
                            smallSpace,
                            Row(
                              children: [
                                AssetDetailed(
                                    svgPath: "assets/icons/mug.svg",
                                    content: "Contigo Luxe ",
                                    title: "Coffee Mug"),
                                horizontalLargeSpace,
                                AssetDetailed(
                                    svgPath: "assets/icons/bag.svg",
                                    content: "Peak D.Everyday",
                                    title: "Mobile Bag"),
                              ],
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
