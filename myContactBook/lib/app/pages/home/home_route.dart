import 'package:flutter/material.dart';
import 'package:my_contact_book/app/pages/home/home_page.dart';
import 'package:provider/provider.dart';

class HomeRoute {
  const HomeRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => Container(),
          ),
        ],
        builder: (context, child) {
          return CBHomePage();
        },
      );
}
