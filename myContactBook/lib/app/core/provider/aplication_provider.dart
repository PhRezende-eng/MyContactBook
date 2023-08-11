import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/client/rest_client.dart';
import 'package:provider/provider.dart';

class CBAplicationBinding extends StatelessWidget {
  final Widget child;
  const CBAplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
      ],
      child: child,
    );
  }
}
