import 'package:flutter/material.dart';

class CBAppBarWidget extends AppBar {
  CBAppBarWidget({
    super.key,
    required String title,
    Widget? leading,
    Color? backgroundColor,
    List<Widget>? actions,
  }) : super(
          title: Text(title),
          leading: leading,
          actions: actions,
          backgroundColor: backgroundColor,
        );
}
