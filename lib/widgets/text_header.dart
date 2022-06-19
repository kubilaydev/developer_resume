import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../tools/constants.dart';

///
class TextHeader extends StatelessWidget {
  ///
  TextHeader({Key? key, required this.headline, required this.subline})
      : super(key: key);
////
  final String headline;

  ///
  final String subline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headline,
          style: Theme.of(context).textTheme.headline1,
        ).tr(),
        Text(
          subline,
          style: Theme.of(context).textTheme.subtitle1,
        ).tr(),
        smallSpace,
        // leftDivider(size: size),
      ],
    );
  }
}
