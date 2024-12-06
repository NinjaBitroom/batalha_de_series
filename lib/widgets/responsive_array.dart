import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveArray extends GetWidget {
  final List<Widget> children;

  const ResponsiveArray({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    if (context.isPhone) {
      return Column(
        children: children,
      );
    } else {
      return Row(
        children: children,
      );
    }
  }
}
