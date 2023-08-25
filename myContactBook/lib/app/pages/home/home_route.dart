import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/client/rest_client.dart';
import 'package:my_contact_book/app/pages/home/home_controller.dart';
import 'package:my_contact_book/app/pages/home/home_page.dart';
import 'package:my_contact_book/app/repository/home/home_repository_impl.dart';
import 'package:provider/provider.dart';

class HomeRoute {
  const HomeRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) =>
                CBHomeRepositoryImpl(context.read<CustomDio>()),
          ),
          Provider(
              create: (context) =>
                  CBHomeController(context.read<CBHomeRepositoryImpl>()))
        ],
        builder: (context, child) {
          return const CBHomePage();
        },
      );
}
//TODO: get user data on home and by rquest user/auth