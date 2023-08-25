import 'package:flutter/material.dart';

class CBLoadingWidget extends StatelessWidget {
  final String title;
  const CBLoadingWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Center(child: Text(title)),
      ],
    );
  }
}
