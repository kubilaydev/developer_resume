import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/app.dart';
import '../tools/constants.dart';
import '../tools/open_on_web.dart';
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
  final int _ssCountNumber = 5;
  final OpenOnWeb _openOnWeb = OpenOnWeb();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        _currentAnimPageValue = controller.page!;
      });
    });
    super.initState();
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
                //  print("appbar Fucn out");
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
                SingleChildScrollView(
                  child: Column(
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
                                //? DEVELOPING
                                if (widget.app.appStatus ==
                                    AppStatus.isDeveloping)
                                  Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isShowGallery = !_isShowGallery;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 62),
                                            child: Image.asset(
                                                "assets/images/app_ss.png"),
                                          ))),
                                //? TESTING
                                if (widget.app.appStatus == AppStatus.isTesting)
                                  Expanded(
                                      child: Column(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isShowGallery = !_isShowGallery;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 62),
                                            child: Image.asset(
                                                "assets/images/app_ss.png"),
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _openOnWeb.launchInWebViewOrVC(
                                                  widget.app.marketLink[0]!);
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 62),
                                            child: Image.asset(
                                                "assets/images/be_tester.png"),
                                          )),
                                    ],
                                  )),
                                //? PUBLISHED
                                if (widget.app.appStatus ==
                                    AppStatus.isPublised)
                                  Expanded(
                                      //? PLAY MARKET
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _openOnWeb.launchInWebViewOrVC(
                                                  widget.app.marketLink[0]!);
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 62),
                                            child: Image.asset(
                                                "assets/images/play_store.png"),
                                          ))),
                                //? ONGITHUB
                                if (widget.app.appStatus ==
                                    AppStatus.isOnGithub)
                                  Expanded(
                                      //? GITHUB
                                      child: GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              _openOnWeb.launchInWebViewOrVC(
                                                  widget.app.marketLink[0]!);
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 62),
                                            child: Image.asset(
                                                "assets/images/check_code.png"),
                                          ))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                        children: _buildPageIndicator(
                            _currentPageIndex, _ssCountNumber),
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

  List<Widget> _buildPageIndicator(int position, int picCount) {
    var list = <Widget>[];
    for (var i = 0; i < picCount; i++) {
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

///
enum AppStatus {
  /// Has links for markets
  isPublised,

  /// Has SS and test link
  isTesting,

  /// Has only SS
  isDeveloping,

  /// Show Github
  isOnGithub,
}
