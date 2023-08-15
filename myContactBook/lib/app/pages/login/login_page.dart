import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/ui/widgets/appbar_widget.dart';
import 'package:my_contact_book/app/pages/login/login_controller.dart';
import 'package:my_contact_book/app/repository/login/login_repository.dart';
import 'package:provider/provider.dart';

class CBLoginPage extends StatefulWidget {
  const CBLoginPage({super.key});

  @override
  State<CBLoginPage> createState() => _CBLoginPageState();
}

class _CBLoginPageState extends State<CBLoginPage> {
  late CBLoginController controller;
  @override
  void initState() {
    super.initState();
    controller = context.read<CBLoginController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CBAppBarWidget(
        title: 'Agenda',
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Text('Faça seu login'),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    controller: controller.passController,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(onPressed: () {}, child: Text('Fazer login')),
                TextButton(
                  onPressed: () => controller.onPressedCreateUser(context),
                  child: const Text('ou Criar conta'),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
