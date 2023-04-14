import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:url_launcher/url_launcher.dart';

final selectableTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
  selectionColor: Color.fromRGBO(218, 123, 210, 0.725),
));

class BodyText extends StatelessWidget {
  const BodyText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Theme(
            data: selectableTheme,
            child: SelectableText.rich(
                textAlign: TextAlign.justify,
                TextSpan(text: text),
                style: body)));
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
    final size = MediaQuery.of(context).size;

    return Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Theme(
            data: selectableTheme,
            child: SelectableText.rich(
                textAlign: TextAlign.justify,
                TextSpan(children: [
                  TextSpan(
                    text: a,
                    style: body,
                  ),
                  TextSpan(
                    text: b,
                    style: bodyHyperlink,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launch(link);
                      },
                  ),
                  TextSpan(text: c, style: body),
                ]))));
  }
}
