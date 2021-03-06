import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../components/banner_text.dart';

import '../models/asset_with_text.dart';

import '../tools/constants.dart';
import '../tools/open_on_web.dart';
import '../widgets/asset_button.dart';
import '../widgets/asset_detailed.dart';
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
  Future<void> launchWhatsApp() async {
    final link = const WhatsAppUnilink(
      phoneNumber: '+90(537)2039740',
      text: "Hello! Can we talk about mobile apps?",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    print(link);
    await launchUrlString('$link');
  }

  final OpenOnWeb _openOnWeb = OpenOnWeb();

  /// https://github.com/kubilaydev
  final Uri _githubUri =
      Uri(scheme: 'https', host: 'www.github.com', path: 'kubilaydev/');

  ///https://www.instagram.com/bilalkubilay/
  final Uri _instaUri =
      Uri(scheme: 'https', host: 'www.instagram.com', path: 'bilalkubilay/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1D1F20),
      body: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
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
                      ),
                      Container(
                        width: 200,
                        height: constraints.maxWidth / aspect,
                        //color: Colors.red,
                        child: Align(
                          alignment: const Alignment(-0.6, -0.2),
                          child: Container(
                            height: 100,
                            width: 150,
                            child: Column(
                              children: const [
                                BannerText(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxWidth / aspect,
                        //color: Colors.red,
                        child: Align(
                          alignment: const Alignment(1, 0.9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                child:
                                    Image.asset("assets/images/own_logo.png"),
                              ),
                              horizontalSpace,
                              const SizedBox(
                                height: 24,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Colors.white,
                                ),
                              ),
                              horizontalSpace,
                              AssetButton(
                                  svgPath: "assets/icons/whatsapp.svg",
                                  voidCallback: () async {
                                    await launchWhatsApp();
                                  }),
                              horizontalSpace,
                              AssetButton(
                                  svgPath: "assets/icons/github.svg",
                                  voidCallback: () {
                                    _openOnWeb.launchInWebViewOrVC(_githubUri);
                                  }),
                              horizontalSpace,
                              AssetButton(
                                  svgPath: "assets/icons/instagram.svg",
                                  voidCallback: () {
                                    _openOnWeb.launchInWebViewOrVC(_instaUri);
                                  }),
                              horizontalSpace,
                            ],
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
                      TextHeader(headline: "about_me", subline: "from_ent"),
                      smallSpace,
                      Text(
                        "about_exp",
                        style: Theme.of(context).textTheme.bodyText1,
                      ).tr(),
                      mediumSpace,
                      AssetDetailed(
                          svgPath: "assets/icons/language.svg",
                          content: "B2+, Upper Intermadiate",
                          title: "certified_eng"),
                      largeSpace,
                      TextHeader(headline: "my_servise", subline: "can_do"),
                      smallSpace,
                      AssetHeader(
                        svgPath: "assets/icons/apps.svg",
                        title: "build_apps",
                      ),
                      smallSpace,
                      Text(
                        "build_exp",
                        style: Theme.of(context).textTheme.bodyText1,
                      ).tr(),
                      ContentAligner<AssetWithTitleOrHeader>(
                          builder: (c) {
                            return AssetTitle(
                                svgPath: c.svgPath, title: c.title);
                          },
                          contents: [
                            AssetWithTitleOrHeader(
                                title: "flutter",
                                svgPath: "assets/icons/flutter_active.svg"),
                            AssetWithTitleOrHeader(
                                title: "supabase",
                                svgPath: "assets/icons/supabase.svg")
                          ]),
                      largeSpace,
                      AssetHeader(
                        svgPath: "assets/icons/ui_design.svg",
                        title: "ui_design",
                      ),
                      mediumSpace,
                      Text(
                        "ui_exp",
                        style: Theme.of(context).textTheme.bodyText1,
                      ).tr(),
                      ContentAligner<AssetWithTitleOrHeader>(
                          builder: (c) {
                            return AssetTitle(
                                svgPath: c.svgPath, title: c.title);
                          },
                          contents: [
                            AssetWithTitleOrHeader(
                                title: "figma",
                                svgPath: "assets/icons/figma.svg"),
                            AssetWithTitleOrHeader(
                                title: "adobe_xd",
                                svgPath: "assets/icons/adobe_xd.svg")
                          ]),
                      largeSpace,
                      AssetHeader(
                        svgPath: "assets/icons/bulb.svg",
                        title: "start_up",
                      ),
                      mediumSpace,
                      Text(
                        "start_exp",
                        style: Theme.of(context).textTheme.bodyText1,
                      ).tr(),
                      smallSpace,
                      AssetTitle(
                          svgPath: "assets/icons/building.svg",
                          title: "been_silicon"),
                      smallSpace,
                      AssetTitle(
                          svgPath: "assets/icons/star.svg",
                          title: "accelerator_exp"),
                      smallSpace,
                      AssetTitle(
                          svgPath: "assets/icons/money_check.svg",
                          title: "company_exp"),
                      smallSpace,
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
