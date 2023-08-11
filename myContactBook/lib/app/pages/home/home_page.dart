import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/ui/theme/theme_config.dart';
import 'package:my_contact_book/app/core/ui/widgets/divider_widget.dart';
import 'package:my_contact_book/app/core/ui/widgets/header_error_widget.dart';

class CBHomePage extends StatefulWidget {
  const CBHomePage({super.key});

  @override
  State<CBHomePage> createState() => _CBHomePageState();
}

class _CBHomePageState extends State<CBHomePage> {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Luiz', style: context.theme.textTheme.headlineSmall),
          Text('Otávio', style: context.theme.textTheme.headlineSmall),
          Text('Número', style: context.theme.textTheme.headlineSmall),
          Text('Email', style: context.theme.textTheme.headlineSmall),
        ],
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.inversePrimary,
        title: const Text('Agenda'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Agenda',
              style: context.theme.textTheme.titleMedium,
            ),
            Text(
              'Seus contatos estão abaixo',
              style: context.theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            const CBHEaderErrorWidget(
              message: 'Um erro qualquer',
            ),
            const SizedBox(height: 24),
            const CBDivider(),
            ...list,
          ],
        ),
      ),
    );
  }
}
