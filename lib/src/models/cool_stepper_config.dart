import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CoolStepperConfig {
  /// [backText] Changes the text that should be displayed for the back button
  ///
  /// [default] is 'BACK'
  final String backText;

  /// [backTextStyle] Changes the text style for the back button
  ///
  /// [default] is TextStyle(color: Colors.grey)
  final TextStyle backTextStyle;

  /// [nextText] Changes the text that should be displayed for the next button
  ///
  /// [default] is 'NEXT'
  final String nextText;

  /// [nextTextStyle] Changes the text style for the next button
  ///
  /// [default] is TextStyle(color: Colors.green)
  final TextStyle nextTextStyle;

  /// [stepText] Changes The text that describes the progress
  ///
  /// [default] is 'STEP'
  final String stepText;

  /// The text that describes the progress
  ///
  /// [default] is 'OF'
  final String ofText;

  /// This is the background color of the header
  final Color headerColor;

  /// [Deprecated] Use [icon] instead
  /// This is the color of the icon
  ///
  /// [This does not apply when icon is set]
  @Deprecated('Use [icon] instead, this will be removed soon!')
  final Color? iconColor;

  /// This icon replaces the default icon
  final Icon icon;

  /// This is the textStyle for the title text
  final TextStyle titleTextStyle;

  /// This is the textStyle for the subtitle text
  final TextStyle subtitleTextStyle;

  /// A List of string that when supplied will override 'backText'
  ///
  /// Must be one less than the number of steps since for the first step, the backText won't be visible
  final List<String>? backTextList;

  /// A List of string that when supplied will override 'nextText'
  ///
  /// Must be one less than the number of steps since the 'finalText' attribute is able to set the value for the final step's next button
  final List<String>? nextTextList;

  /// The text that should be displayed for the next button on the final step
  ///
  /// [default] is 'FINISH'
  final String finalText;

  const CoolStepperConfig({
    this.backText = 'PREV',
    this.nextText = 'NEXT',
    this.stepText = 'STEP',
    this.ofText = 'OF',
    this.headerColor = const Color(0xffbdbdbd),
    this.iconColor,
    this.icon = const Icon(
      Icons.help_outline,
      size: 18,
      color: Color(0x61000000),
    ),
    this.titleTextStyle = const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Color(0x61000000),
    ),
    this.subtitleTextStyle = const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Color(0xFF000000),
    ),
    this.backTextList,
    this.nextTextList,
    this.finalText = 'FINISH',
    this.nextTextStyle = const TextStyle(color: Colors.green),
    this.backTextStyle = const TextStyle(color: Colors.grey),
  });
}
