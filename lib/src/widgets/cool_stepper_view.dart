import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';
import 'package:cool_stepper_reloaded/src/models/cool_step.dart';
import 'package:cool_stepper_reloaded/src/rounded_corner_container/rounded_corner_container.dart';
import 'package:flutter/material.dart';

/// [CoolStepperView] is the step builder, each step page is build here
class CoolStepperView extends StatelessWidget {
  /// [step] is the individual step widget
  final CoolStep step;

  /// [contentPadding] is the padding of the content inside the [step] content
  final EdgeInsetsGeometry contentPadding;

  /// [CoolStepperConfig] is the configuration of the widget, read the component to know it defaults values
  final CoolStepperConfig config;

  /// [isHeaderEnabled] enable the default header, if you want to build a custom title or header, disable this
  ///
  /// [default] is true
  final bool isHeaderEnabled;

  /// [hasRoundedCorner] enable the rounded corner between step and header
  ///
  /// [default] is true
  final bool hasRoundedCorner;

  const CoolStepperView({
    required this.step,
    required this.contentPadding,
    required this.config,
    required this.isHeaderEnabled,
    required this.hasRoundedCorner,
  });

  @override
  Widget build(BuildContext context) {
    /// [header] contains title, description and icon
    final header = Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: config.headerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  step.title.toUpperCase(),
                  style: config.titleTextStyle,
                  maxLines: 2,
                ),
              ),
              SizedBox(width: 5.0),
              config.icon,
            ],
          ),
          SizedBox(height: 5.0),
          Text(
            step.subtitle,
            style: config.subtitleTextStyle,
          )
        ],
      ),
    );

    /// [body] is always show, this will contain the [step] content
    Widget body = Align(
      alignment: step.alignment,
      child: SingleChildScrollView(
        padding: contentPadding,
        child: step.content,
      ),
    );

    if (hasRoundedCorner) {
      body = RoundedCornerContainer(
        outsideColor: config.headerColor,
        insideColor: config.stepColor,
        child: body,
      );
    }

    return (isHeaderEnabled && step.title.isNotEmpty)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [header, Expanded(child: body)],
          )
        : body;
  }
}
