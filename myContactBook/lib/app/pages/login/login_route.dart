import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/client/rest_client.dart';
import 'package:my_contact_book/app/pages/login/login_controller.dart';
import 'package:my_contact_book/app/pages/login/login_page.dart';
import 'package:my_contact_book/app/repository/login/login_repository_impl.dart';
import 'package:provider/provider.dart';

class LoginRoute {
  const LoginRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) =>
                CBLoginRepositoryImpl(context.read<CustomDio>()),
          ),
          Provider(
            create: (context) =>
                CBLoginController(context.read<CBLoginRepositoryImpl>()),
          ),
        ],
        builder: (context, child) {
          return const CBLoginPage();
        },
      );
}
