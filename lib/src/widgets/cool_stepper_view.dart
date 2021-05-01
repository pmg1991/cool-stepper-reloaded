import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';
import 'package:cool_stepper_reloaded/src/models/cool_step.dart';
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

  const CoolStepperView({
    required this.step,
    required this.contentPadding,
    required this.config,
    required this.isHeaderEnabled,
  });

  @override
  Widget build(BuildContext context) {
    /// [header] contains title, description and icon
    final header = Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0),
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
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  step.title.toUpperCase(),
                  style: config.titleTextStyle,
                  maxLines: 2,
                ),
              ),
              SizedBox(width: 5.0),
              Visibility(
                visible: config.iconColor != null,
                replacement: config.icon,
                child: Icon(
                  Icons.help_outline,
                  size: 18,
                  color: config.iconColor ?? Colors.black38,
                ),
              )
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
    final body = SingleChildScrollView(
      padding: contentPadding,
      child: step.content,
    );

    return (isHeaderEnabled)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [header, Expanded(child: body)],
          )
        : body;
  }
}
