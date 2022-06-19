import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'init/resume.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      path: 'assets/translations', //
      fallbackLocale: const Locale('en', 'US'),
      child: Resume()));
}
