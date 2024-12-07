import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveArray extends GetResponsiveView {
  final List<Widget> children;

  ResponsiveArray({super.key, required this.children})
      : super(alwaysUseBuilder: false);

  @override
  Widget? phone() {
    return Column(
      children: children,
    );
  }

  @override
  Widget desktop() {
    return Row(
      children: children,
    );
  }
}
