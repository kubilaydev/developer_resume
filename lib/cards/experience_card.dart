import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tools/constants.dart';

///
class ExperienceCard extends StatelessWidget {
  ///
  const ExperienceCard({
    Key? key,
    required this.svgIconPath,
    required this.title,
    required this.location,
    required this.date,
    required this.content,
  }) : super(key: key);

  ///
  final String svgIconPath;

  ///
  final String title;

  ///
  final String content;

  ///
  final String location;

  ///
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        smallSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 54,
              width: 54,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0XFFD9D9D9).withOpacity(0.2),
                  shape: BoxShape.circle),
              child: SvgPicture.asset(svgIconPath),
            ),
            horizontalSpace,
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 42,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  constraints:
                      const BoxConstraints(minWidth: 350, maxWidth: 500),
                  decoration: const BoxDecoration(
                    color: Color(0XFF0E73CC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 18)),
                      Text(date,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 16)),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  constraints:
                      const BoxConstraints(minWidth: 350, maxWidth: 500),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(content,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 18)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(),
                          Row(
                            children: [
                              Container(
                                  height: 18,
                                  width: 18,
                                  child: SvgPicture.asset(
                                    "assets/icons/marker.svg",
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(location,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                smallSpace,
              ],
            )
          ],
        ),
      ],
    );
  }
}
