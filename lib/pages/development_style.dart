import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/asset_with_text.dart';

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

  final List<Equipment> _equipments = [
    Equipment(
        svgPath: "assets/icons/macbook.svg",
        content: "Macbook Pro 14''",
        title: "computer"),
    Equipment(
        svgPath: "assets/icons/screen.svg",
        content: "AOC 23.8” IPS SLIM",
        title: "screen"),
    Equipment(
        svgPath: "assets/icons/keyboard.svg",
        content: "Apple Magic Keyb.",
        title: "keyboard"),
    Equipment(
        svgPath: "assets/icons/mouse.svg",
        content: "Apple Magic Mouse",
        title: "mouse"),
    Equipment(
        svgPath: "assets/icons/ios.svg",
        content: "iPhone 11",
        title: "ios_device"),
    Equipment(
        svgPath: "assets/icons/android.svg",
        content: "Honor Magic 2",
        title: "android_device"),
    Equipment(
        svgPath: "assets/icons/mug.svg",
        content: "Contigo Luxe ",
        title: "coffee_mug"),
    Equipment(
        svgPath: "assets/icons/bag.svg",
        content: "Peak D.Everyday",
        title: "Mobile Bag"),
  ];

  final List<AssetWithTitleOrHeader> _suitableOffice = [
    AssetWithTitleOrHeader(svgPath: "assets/icons/stop.svg", title: "no_need"),
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/shift.svg", title: "suitable_shift"),
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/social.svg", title: "social_comp"),
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/office.svg", title: "office_location"),
  ];

  final List<AssetWithTitleOrHeader> _suitableRemote = [
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/clickup.svg", title: "Clickup"),
    AssetWithTitleOrHeader(
        svgPath: "assets/icons/online_meeting.svg", title: "meeting_apps"),
    AssetWithTitleOrHeader(svgPath: "assets/icons/github.svg", title: "github"),
    AssetWithTitleOrHeader(svgPath: "assets/icons/notion.svg", title: "notion"),
    AssetWithTitleOrHeader(svgPath: "assets/icons/slack.svg", title: "slack"),
    AssetWithTitleOrHeader(svgPath: "assets/icons/trello.svg", title: "trello"),
  ];

  @override
  Widget build(BuildContext context) {
    Widget result = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? HEADER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeader(headline: "dev_style", subline: "dev_exp"),
                smallSpace,
                Text(
                  "style_exp",
                  style: Theme.of(context).textTheme.bodyText1,
                ).tr(),
                largeSpace,
                AssetHeader(
                  svgPath: "assets/icons/remote.svg",
                  title: "remote_work",
                ),
                smallSpace,
                Text(
                  "remote_exp",
                  style: Theme.of(context).textTheme.bodyText1,
                ).tr(),
                smallSpace,
                AssetTitle(
                    svgPath: "assets/icons/run_hours.svg",
                    title: "min_pomodoro"),
                largeSpace,
                Text(
                  "suitable_with",
                  style: Theme.of(context).textTheme.bodyText1,
                ).tr(),
                smallSpace,
                ContentAligner<AssetWithTitleOrHeader>(
                    space: mediumSpace,
                    builder: (s) {
                      return AssetTitle(svgPath: s.svgPath, title: s.title);
                    },
                    contents: _suitableRemote),
                largeSpace,
                AssetHeader(
                  svgPath: "assets/icons/office.svg",
                  title: "office_work",
                ),
                smallSpace,
                Text(
                  "office_exp",
                  style: Theme.of(context).textTheme.bodyText1,
                ).tr(),
                largeSpace,
                Text(
                  "suitable_with",
                  style: Theme.of(context).textTheme.bodyText1,
                ).tr(),
                mediumSpace,
                ContentAligner<AssetWithTitleOrHeader>(
                    space: mediumSpace,
                    builder: (s) =>
                        AssetTitle(svgPath: s.svgPath, title: s.title),
                    contents: _suitableOffice),
                largeSpace,
                AssetHeader(
                  svgPath: "assets/icons/magic.svg",
                  title: "dev_equipment",
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
      )),
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
