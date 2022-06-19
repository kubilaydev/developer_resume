import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../tools/constants.dart';

///
class BannerText extends StatelessWidget {
  ///
  const BannerText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "hi".tr(),
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
            children: <TextSpan>[
          TextSpan(
              text: "i".tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20)),
          TextSpan(
              text: "design".tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20, color: designRed)),
          TextSpan(
              text: " & ",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20)),
          TextSpan(
              text: "build".tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20, color: buildBlue)),
          TextSpan(
              text: "mobile_apps".tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20)),
        ]));
  }
}
