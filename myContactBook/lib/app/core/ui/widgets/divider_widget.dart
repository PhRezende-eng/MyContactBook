import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/ui/theme/theme_config.dart';

class CBDivider extends StatelessWidget {
  const CBDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.onBackground,
      width: double.infinity,
      height: 1,
    );
  }
}
