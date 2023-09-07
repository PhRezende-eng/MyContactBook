import 'package:flutter/material.dart';
import 'package:my_contact_book/app/models/user_model.dart';
import 'package:my_contact_book/app/service/user_service.dart';
import 'package:provider/provider.dart';

class CBLoginIconButtonWidget extends StatelessWidget {
  const CBLoginIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final navigator = Navigator.of(context);
        final userService = context.read<CBUserService>();
        if (userService.user == null) {
          final result = await navigator.pushNamed('/login');
          if (result is CBUserModel) {
            userService.user = result;
          } else {
            userService.user = null;
          }
        } else {
          // final result = await navigator.pushNamed('/login');
          // if (result is CBUserModel) {
          //   userService.user = result;
          // } else {
          //   userService.user = null;
          // }
        }
      },
      icon: const Icon(Icons.person, size: 30),
    );
  }
}
