import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../tools/constants.dart';

///
class AssetDetailed extends StatelessWidget {
  ///
  AssetDetailed({
    Key? key,
    required this.svgPath,
    required this.title,
    required this.content,
  }) : super(key: key);

  ///
  final String svgPath;

  ///
  final String title;

  ///
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(height: 36, width: 36, child: SvgPicture.asset(svgPath)),
        horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12),
            ),
            Text(
              content,
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
