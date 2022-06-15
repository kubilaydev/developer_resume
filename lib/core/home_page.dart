import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

  final pages = [
    MyServise(),
    MyServise(),
    MyServise(),
    MyServise(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1D1F20),
      body: pages[pageIndex],
      bottomNavigationBar: appNavbar(context),
    );
  }

  Container appNavbar(BuildContext context) {
    return Container(
      height: 60,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            splashColor: Colors.transparent,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset("assets/icons/user_active.svg"),
                  )
                : Container(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset("assets/icons/user_passive.svg"),
                  ),
          ),
          IconButton(
              enableFeedback: false,
              splashColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? Container(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset("assets/icons/flutter_active.svg"),
                    )
                  : Container(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset("assets/icons/flutter_passive.svg"),
                    )),
          IconButton(
              enableFeedback: false,
              splashColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? Container(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset("assets/icons/pc_active.svg"),
                    )
                  : Container(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset("assets/icons/pc_passive.svg"),
                    )),
          IconButton(
              enableFeedback: false,
              splashColor: Colors.transparent,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? Container(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset("assets/icons/business_active.svg"),
                    )
                  : Container(
                      height: 24,
                      width: 24,
                      child:
                          SvgPicture.asset("assets/icons/business_passive.svg"),
                    )),
        ],
      ),
    );
  }
}
