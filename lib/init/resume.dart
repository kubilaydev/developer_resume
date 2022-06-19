import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/home_page.dart';

import '../theme/app_theme.dart';

///
class Resume extends StatelessWidget {
  ///
  Resume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: '',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
