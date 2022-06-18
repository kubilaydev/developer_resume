import 'package:flutter/material.dart';

import '../tools/constants.dart';

///
class ContentAligner<T> extends StatelessWidget {
  ///
  const ContentAligner(
      {required this.builder,
      this.breakPoint = 350,
      required this.contents,
      this.space = smallSpace,
      Key? key})
      : super(key: key);

  ///
  final List<T> contents;

  ///
  final double breakPoint;

  ///
  final Widget Function(T object) builder;

  ///
  final Widget space;

  ///
  final int breakWith = 350;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (MediaQuery.of(context).size.width < breakWith)
          for (var eq in contents) ...[space, builder(eq)],
        if (MediaQuery.of(context).size.width >= breakWith)
          ...List.generate((contents.length / 2).ceil(), (index) {
            var f = contents[2 * index];
            var s = index >= contents.length ? null : contents[(2 * index) + 1];
            return Column(
              children: [
                space,
                Row(
                  children: [
                    Expanded(
                      child: builder(f),
                    ),
                    horizontalLargeSpace,
                    if (s != null)
                      Expanded(
                        child: builder(s),
                      ),
                  ],
                ),
              ],
            );
          }),
      ],
    );
  }
}