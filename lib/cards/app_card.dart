import 'package:flutter/material.dart';

import '../tools/constants.dart';

///
class AppCard extends StatelessWidget {
  ///
  const AppCard({
    Key? key,
    required this.assetPath,
    required this.appName,
  }) : super(key: key);

  ///
  final String assetPath;

  ///
  final String appName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        smallSpace,
        Stack(children: [
          AspectRatio(
            aspectRatio: 2,
            child: Stack(
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
                    child: Image.asset(assetPath),
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
                    "Şive App",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Align(
                  alignment: const Alignment(-2, 0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 32,
                        child: Image.asset("assets/images/app_store.png"),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        height: 32,
                        child: Image.asset("assets/images/app_store.png"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
        smallSpace,
      ],
    );
  }
}
