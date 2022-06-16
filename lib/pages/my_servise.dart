import 'package:flutter/material.dart';

import '../models/content.dart';
import '../tools/constants.dart';
import '../widgets/asset_header.dart';
import '../widgets/asset_title.dart';
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
                      Container(
                          width: size.width,
                          height: Image.asset("assets/images/me.jpg").height,
                          child: Stack(
                            children: [
                              Container(
                                  width: size.width,
                                  child: Image.asset("assets/images/me.jpg")),
                              CustomPaint(
                                painter: HeaderTitlePainter(
                                  size: size,
                                  height: size.height,
                                  width: size.width,
                                ),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: size.width * 0.2),
                                    child: const Center(
                                      child: Text(
                                        "HELLO!",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )),
                              ),
                            ],
                          )),
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
                            Row(
                              children: [
                                AssetTitle(
                                    svgPath: "assets/icons/figma.svg",
                                    title: "Figma"),
                                horizontalLargeSpace,
                                AssetTitle(
                                    svgPath: "assets/icons/adobe_xd.svg",
                                    title: "Adobe XD"),
                              ],
                            ),
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
                                title: "Company and Investment Experience "),
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
    );
  }
}
