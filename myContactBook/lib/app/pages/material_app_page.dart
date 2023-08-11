import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/provider/aplication_provider.dart';
import 'package:my_contact_book/app/core/ui/theme/theme_config.dart';
import 'package:my_contact_book/app/pages/login/login_route.dart';

import 'home/home_route.dart';

class CBMaterialApp extends StatelessWidget {
  const CBMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CBAplicationBinding(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CBThemeConfig.theme,
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeRoute.page,
          '/login': (context) => LoginRoute.page,
        },
      ),
    );
  }
}
