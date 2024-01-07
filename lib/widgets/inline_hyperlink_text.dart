import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:url_launcher/url_launcher.dart';

class InlineHyperlinkText extends StatelessWidget {
  final List<String> textParts;
  final List<String> linkParts;

  InlineHyperlinkText(this.textParts, this.linkParts);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: _buildTextSpans(),
      ),
    );
  }

  List<TextSpan> _buildTextSpans() {
    List<TextSpan> spans = [];
    for (int i = 0; i < textParts.length; i++) {
      if (i % 2 == 0) {
        // Regular text
        spans.add(TextSpan(text: textParts[i], style: body));
      } else {
        // Hyperlink
        spans.add(
          TextSpan(
            text: textParts[i],
            style: bodyHyperlink,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _launchURL(linkParts[i~/2]);
              },
          ),
        );
      }
    }
    return spans;
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
