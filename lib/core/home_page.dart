import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/development_style.dart';
import '../pages/done_projects.dart';
import '../pages/my_experince.dart';
import '../pages/my_servise.dart';

///
class HomePage extends StatefulWidget {
  ///
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  late PageController controller = PageController(initialPage: pageIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1D1F20),
      body: PageView(
        children: [
          MyServise(),
          DoneProjects(),
          MyExperience(),
          DevelopmentStyle(),
        ],
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
      ),
      bottomNavigationBar: appNavbar(context),
    );
  }

  Widget navBarItem(int index, String active, String passive) {
    return IconButton(
      enableFeedback: false,
      splashColor: Colors.transparent,
      onPressed: () {
        setState(() {
          pageIndex = index;
          controller.animateToPage(pageIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        });
      },
      icon: pageIndex == index
          ? Container(
              height: 24,
              width: 24,
              child: SvgPicture.asset(active),
            )
          : Container(
              height: 24,
              width: 24,
              child: SvgPicture.asset(passive),
            ),
    );
  }

  Widget appNavbar(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 96),
      alignment: Alignment.center,
      child: Container(
        width: 500,
        margin: const EdgeInsets.only(top: 12, bottom: 24, left: 12, right: 12),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 0),
              )
            ],
            color: const Color(0XFF252525),
            borderRadius: BorderRadius.circular(32)),
        height: 60,
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navBarItem(0, "assets/icons/user_active.svg",
                  "assets/icons/user_passive.svg"),
              navBarItem(1, "assets/icons/flutter_active.svg",
                  "assets/icons/flutter_passive.svg"),
              navBarItem(2, "assets/icons/business_active.svg",
                  "assets/icons/business_passive.svg"),
              navBarItem(3, "assets/icons/pc_active.svg",
                  "assets/icons/pc_passive.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
