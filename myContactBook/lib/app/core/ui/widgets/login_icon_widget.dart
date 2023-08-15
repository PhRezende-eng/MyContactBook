import 'package:flutter/material.dart';

class CBLoginIconButtonWidget extends StatelessWidget {
  const CBLoginIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      icon: const Icon(Icons.person, size: 30),
    );
  }
}
