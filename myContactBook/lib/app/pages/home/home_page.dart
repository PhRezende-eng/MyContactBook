import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_contact_book/app/core/ui/theme/theme_config.dart';
import 'package:my_contact_book/app/core/ui/widgets/appbar_widget.dart';
import 'package:my_contact_book/app/core/ui/widgets/divider_widget.dart';
import 'package:my_contact_book/app/core/ui/widgets/header_error_widget.dart';
import 'package:my_contact_book/app/core/ui/widgets/loading_widget.dart';
import 'package:my_contact_book/app/core/ui/widgets/login_icon_widget.dart';
import 'package:my_contact_book/app/pages/home/home_controller.dart';
import 'package:my_contact_book/app/pages/home/home_state.dart';
import 'package:provider/provider.dart';

class CBHomePage extends StatefulWidget {
  const CBHomePage({super.key});

  @override
  State<CBHomePage> createState() => _CBHomePageState();
}

class _CBHomePageState extends State<CBHomePage> {
  late CBHomeController _controller;
  @override
  void initState() {
    super.initState();
    _controller = context.read<CBHomeController>();
    _controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    // var list = <Widget>[
    //   const SizedBox(height: 16),
    //   Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       Text('Luiz', style: context.theme.textTheme.headlineSmall),
    //       Text('Otávio', style: context.theme.textTheme.headlineSmall),
    //       Text('Número', style: context.theme.textTheme.headlineSmall),
    //       Text('Email', style: context.theme.textTheme.headlineSmall),
    //     ],
    //   ),
    // ];
    return Scaffold(
      appBar: CBAppBarWidget(
        title: 'Agenda',
        actions: const [CBLoginIconButtonWidget()],
      ),
      body: BlocBuilder<CBHomeController, CBHomeState>(
        builder: (context, state) {
          if (state.status == CBHomeStatus.loading) {
            return const CBLoadingWidget(
                title: "Carregando sua lista de contato...");
          } else if (state.status == CBHomeStatus.errors) {
            return Column(
              children: state.errors!
                  .map((error) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CBHEaderErrorWidget(message: error),
                      ))
                  .toList(),
            );
          } else {
            return Center(
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
                  // ...list,
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
