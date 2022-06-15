import 'package:flutter/material.dart';

import '../core/home_page.dart';

import '../theme/app_theme.dart';

///* MATERIAL APP STATE
class Resume extends StatelessWidget {
  ///
  Resume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
