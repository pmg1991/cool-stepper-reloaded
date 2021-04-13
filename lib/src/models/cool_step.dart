import 'package:flutter/widgets.dart';

class CoolStep {
  final String title;
  final String subtitle;
  final Widget content;
  final String Function()? validation;

  CoolStep({
    required this.content,
    this.title = '',
    this.subtitle = '',
    this.validation,
  });
}
