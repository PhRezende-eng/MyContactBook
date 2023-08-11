import 'package:flutter/material.dart';

class CBLoginPage extends StatefulWidget {
  const CBLoginPage({super.key});

  @override
  State<CBLoginPage> createState() => _CBLoginPageState();
}

class _CBLoginPageState extends State<CBLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text('Faça seu login'),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('ou Criar conta'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
