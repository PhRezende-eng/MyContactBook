import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/ui/theme/theme_config.dart';

class CBHEaderErrorWidget extends StatelessWidget {
  final String message;
  const CBHEaderErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.errorContainer,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        message,
        style: context.theme.textTheme.bodyLarge!.copyWith(
          color: context.theme.colorScheme.error,
        ),
      ),
    );
  }
}
