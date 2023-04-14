import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:url_launcher/url_launcher.dart';

final selectableTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
  cursorColor: Colors.yellow,
  selectionColor: Colors.green,
  selectionHandleColor: Colors.blue,
));

class BodyText extends StatelessWidget {
  const BodyText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: selectableTheme,
        child: SelectableText.rich(TextSpan(text: text), style: body));
  }
}

class BodyTextWithSingleHyperlink extends StatelessWidget {
  const BodyTextWithSingleHyperlink(this.a, this.b, this.c, this.link,
      {super.key});

  final String a;
  final String b;
  final String c;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: selectableTheme,
        child: SelectableText.rich(TextSpan(children: [
          TextSpan(text: a, style: body),
          TextSpan(
            text: b,
            style: body,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(link);
              },
          ),
          TextSpan(text: c, style: body),
        ])));
  }
}
