import 'package:cool_stepper_reloaded/cool_stepper_reloaded.dart';
import 'package:cool_stepper_reloaded/src/models/cool_step.dart';
import 'package:flutter/material.dart';

class CoolStepperView extends StatelessWidget {
  final CoolStep step;
  final EdgeInsetsGeometry contentPadding;
  final CoolStepperConfig config;
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

    final body = Expanded(
      child: SingleChildScrollView(
        padding: contentPadding,
        child: step.content,
      ),
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (isHeaderEnabled) ? [body] : [body, header],
      ),
    );
  }
}
