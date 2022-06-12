import 'package:flutter/material.dart';

import '../widgets/header_title_painter.dart';

///
class MyServise extends StatefulWidget {
  ///
  MyServise({Key? key}) : super(key: key);

  @override
  State<MyServise> createState() => _MyServiseState();
}

class _MyServiseState extends State<MyServise> {
  @override
  Widget build(BuildContext context) {
    /// Size of page
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: size.width,
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: HeaderTitlePainter(size: size),
                    ),
                    Container(
                        width: size.width,
                        child: Image.asset("assets/images/me.jpg")),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
