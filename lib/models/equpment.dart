import 'asset_with_text.dart';

///
class Equipment extends AssetWithTitleOrHeader {
  ///
  Equipment(
      {required this.content, required super.title, required super.svgPath});

  ///
  final String content;
}
