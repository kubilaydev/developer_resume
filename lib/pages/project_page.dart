import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/app.dart';
import '../tools/constants.dart';
import '../widgets/main_appbar.dart';

///
class ProjectPage extends StatefulWidget {
  ///
  ProjectPage(
      {required this.app, required this.tag, required this.header, Key? key})
      : super(key: key);

  ///
  final String tag;

  ///
  final Widget header;

  ///
  final App app;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  PageController controller = PageController();
  var _currentAnimPageValue = 0.0;
  int _currentPageIndex = 0;
  double startPositionY = 0.0;
  bool _isShowGallery = false;
  final int _ssCountNumber = 7;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        _currentAnimPageValue = controller.page!;
      });
    });
    super.initState();
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: MainAppBar(
            func: () {
              setState(() {
                _isShowGallery = !_isShowGallery;
                print("appbar Fucn out");
              });
            },
            title: widget.app.appName,
            isShowGallery: _isShowGallery,
          )),
      backgroundColor: const Color(0XFF1D1F20),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onVerticalDragStart: (details) {
                          startPositionY = details.globalPosition.dy;
                        },
                        onVerticalDragEnd: (details) {
                          print(details.primaryVelocity);
                          if (details.primaryVelocity! > 10) {
                            Navigator.pop(context);
                          }
                        },
                        child: Hero(tag: widget.tag, child: widget.header)),
                    smallSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 24),
                      child: Column(
                        children: [
                          Text(
                            widget.app.appExp,
                            style: Theme.of(context).textTheme.bodyText1,
                          ).tr(),
                          mediumSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (widget.app.marketLink.isEmpty)
                                Expanded(
                                    //? SCREEN SHOT
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isShowGallery = !_isShowGallery;
                                          });
                                        },
                                        child: Image.asset(
                                            "assets/images/app_ss.png"))),
                              if (widget.app.marketLink.length == 1)
                                Expanded(
                                    //? PLAY MARKET
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _launchInWebViewOrVC(
                                                widget.app.marketLink[0]!);
                                          });
                                        },
                                        child: Image.asset(
                                            "assets/images/play_store.png"))),
                              if (widget.app.marketLink.length == 3)
                                Expanded(
                                    //? GITHUB
                                    child: GestureDetector(
                                        onTap: () async {
                                          setState(() {
                                            _launchInWebViewOrVC(
                                                widget.app.marketLink[2]!);
                                          });
                                        },
                                        child: Image.asset(
                                            "assets/images/check_code.png"))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //? GALLERY
                if (_isShowGallery)
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.all(12),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(12)),
                            child: PageView.builder(
                              controller: controller,
                              itemCount: _ssCountNumber,
                              onPageChanged: (value) {
                                setState(() {
                                  _currentPageIndex = value;
                                });
                              },
                              itemBuilder: (context, position) {
                                {
                                  return Transform(
                                    transform: Matrix4.identity()
                                      ..rotateX(
                                          _currentAnimPageValue - position),
                                    child: Image.asset(
                                        "assets/projects/${widget.app.appId}/$position.png"),
                                  );
                                }
                              },
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(_currentPageIndex),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator(int position) {
    var list = <Widget>[];
    for (var i = 0; i < 7; i++) {
      list.add(i == position ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: Colors.white.withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : const BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? Colors.white.withOpacity(0.2) : Colors.black,
        ),
      ),
    );
  }
}
