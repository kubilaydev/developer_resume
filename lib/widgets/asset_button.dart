import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///
class AssetButton extends StatelessWidget {
  ///
  const AssetButton(
      {required this.svgPath, required this.voidCallback, Key? key})
      : super(key: key);

  ///
  final VoidCallback voidCallback;

  ///
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      child: ElevatedButton(
        child: SvgPicture.asset(
          svgPath,
          color: Colors.white,
        ),
        onPressed: voidCallback,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8),
          primary: Colors.white.withOpacity(0.2),
          fixedSize: const Size(60, 60),
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
