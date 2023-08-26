import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_contact_book/app/core/ui/widgets/appbar_widget.dart';
import 'package:my_contact_book/app/core/ui/widgets/header_error_widget.dart';
import 'package:my_contact_book/app/pages/login/login_controller.dart';
import 'package:my_contact_book/app/pages/login/login_state.dart';

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
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CBAppBarWidget(
        title: 'Agenda',
      ),
      body: BlocBuilder<CBLoginController, CBLoginState>(
          builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text('Faça seu login'),
                    const SizedBox(height: 16),
                    if (state.status == CBLoginStatus.errors)
                      Column(
                        children: state.errors!
                            .map((error) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CBHEaderErrorWidget(message: error),
                                ))
                            .toList(),
                      ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: controller.passController,
                      decoration: const InputDecoration(labelText: 'Senha'),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: state.status == CBLoginStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 16),
                        FilledButton(
                            onPressed: () =>
                                controller.onPressedLoginUser(context),
                            child: const Text('Fazer login')),
                        TextButton(
                          onPressed: () =>
                              controller.onPressedCreateUser(context),
                          child: const Text('ou Criar conta'),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
            ),
          ],
        );
      }),
    );
  }
}
