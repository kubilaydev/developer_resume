import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../tools/constants.dart';

///
class AssetTitle extends StatelessWidget {
  ///
  AssetTitle({
    Key? key,
    required this.svgPath,
    required this.title,
  }) : super(key: key);

  ///
  final String svgPath;

  ///
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: 32,
            width: 32,
            child: SvgPicture.asset(
              svgPath,
            )),
        horizontalSpace,
        Text(
          title,
          maxLines: 2,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
