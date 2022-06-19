///
class App {
  ///
  App(
      {required this.appName,
      required this.assetPath,
      required this.appId,
      required this.appExp,
      required this.marketLink});

  ///
  final String appName;

  ///
  final String assetPath;

  ///
  final String appId;

  ///
  final String appExp;

  /// firtst apple market, second play store
  final List<Uri?> marketLink;
}
