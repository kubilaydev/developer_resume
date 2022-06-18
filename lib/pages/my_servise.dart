import 'package:flutter/material.dart';

import '../models/asset_with_text.dart';
import '../models/content.dart';
import '../tools/constants.dart';
import '../widgets/asset_header.dart';
import '../widgets/asset_title.dart';
import '../widgets/content_aligner.dart';
import '../widgets/header_title_painter.dart';
import '../widgets/text_header.dart';

///
class MyServise extends StatefulWidget {
  ///
  MyServise({Key? key}) : super(key: key);

  @override
  State<MyServise> createState() => _MyServiseState();
}

class _MyServiseState extends State<MyServise> {
  Future<Map<String, dynamic>> contentFtr = Content().getTextContent();

  @override
  Widget build(BuildContext context) {
    /// Size of page

    return Scaffold(
      backgroundColor: const Color(0XFF1D1F20),
      body: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SafeArea(
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
                          LayoutBuilder(builder: (context, constraints) {
                            var aspect = 6000 / 3376;
                            return Stack(
                              children: [
                                Image.asset("assets/images/me.jpg",
                                    width: constraints.maxWidth,
                                    height: constraints.maxWidth / aspect),
                                CustomPaint(
                                  painter: HeaderTitlePainter(
                                    size: Size(constraints.maxWidth,
                                        constraints.maxWidth / aspect),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "HELLO!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextHeader(
                                    headline: "About Me",
                                    subline:
                                        "From entrepreneurship to development"),
                                smallSpace,
                                Text(
                                  content.data!["about_me"],
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                largeSpace,
                                TextHeader(
                                    headline: "My Servise",
                                    subline: "What i can do for you?"),
                                largeSpace,
                                AssetHeader(
                                  svgPath: "assets/icons/apps.svg",
                                  title: "My Servise",
                                ),
                                smallSpace,
                                Text(
                                  content.data!["about_me"],
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                largeSpace,
                                AssetHeader(
                                  svgPath: "assets/icons/ui_design.svg",
                                  title: "UI Design",
                                ),
                                smallSpace,
                                Text(
                                  content.data!["ui_design"],
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                smallSpace,
                                ContentAligner<AssetWithTitleOrHeader>(
                                    builder: (c) {
                                      return AssetTitle(
                                          svgPath: c.svgPath, title: c.title);
                                    },
                                    contents: [
                                      AssetWithTitleOrHeader(
                                          title: "Figma",
                                          svgPath: "assets/icons/figma.svg"),
                                      AssetWithTitleOrHeader(
                                          title: "Adobe XD",
                                          svgPath: "assets/icons/adobe_xd.svg")
                                    ]),
                                largeSpace,
                                AssetHeader(
                                  svgPath: "assets/icons/bulb.svg",
                                  title: "Start-up Consultancy",
                                ),
                                smallSpace,
                                Text(
                                  content.data!["start_up"],
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                smallSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/building.svg",
                                    title: "Been in Silicon Valley "),
                                smallSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/star.svg",
                                    title: "Many Accelerators Experience"),
                                smallSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/money_check.svg",
                                    title:
                                        "Company and Investment Experience "),
                                smallSpace,
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
