import 'package:flutter/material.dart';

import '../models/app.dart';
import '../pages/project_page.dart';

///
class AppCard extends StatelessWidget {
  ///
  const AppCard({Key? key, required this.app}) : super(key: key);

  ///
  final App app;

  @override
  Widget build(BuildContext context) {
    var child = Image.asset(app.assetPath);
    Widget result = Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: Offset(0, 0),
                ),
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: child,
          ),
        ),
        Container(
            decoration: const BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [
                        0.1,
                        0.9,
                      ],
                      colors: [
                        Colors.black.withOpacity(.6),
                        Colors.transparent,
                      ])),
            )),
        Align(
          alignment: const Alignment(-0.8, 0.8),
          child: Text(
            app.appName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Align(
          alignment: const Alignment(-2, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (app.marketLink.isEmpty)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  height: 36,
                  child: Image.asset("assets/images/app_ss.png"),
                ),
              if (app.marketLink.length == 3)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  height: 36,
                  child: Image.asset("assets/images/check_code.png"),
                ),
              if (app.marketLink.length == 1)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  height: 36,
                  child: Image.asset("assets/images/play_store.png"),
                ),
            ],
          ),
        )
      ],
    );

    result = Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: AspectRatio(
        aspectRatio: 2,
        child: GestureDetector(
            onTap: () {
              print("clicked");
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ProjectPage(app: app, tag: app.appName, header: child);
              }));
            },
            child: result),
      ),
    );

    return Hero(tag: app.appName, child: result);
  }
}
