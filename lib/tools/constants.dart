import 'package:flutter/material.dart';

///
const Color kGreyColor = Color(0xFFC4C4C4);

///
const Color kYellowColor = Color(0xFFFFE900);

///
const kAnimationDuration = Duration(milliseconds: 250);

///
const kAnimationCurve = Curves.easeInOut;

///
const smallSpace = SizedBox(
  height: 12,
);

///
const mediumSpace = SizedBox(
  height: 24,
);

///
const largeSpace = SizedBox(
  height: 36,
);

///
const horizontalSpace = SizedBox(
  width: 12,
);

///
const horizontalLargeSpace = SizedBox(
  width: 24,
);

///
Divider leftDivider({required Size size}) {
  return Divider(
    endIndent: size.width / 2,
    thickness: 0.4,
    color: Colors.white,
    height: 12,
  );
}
///

