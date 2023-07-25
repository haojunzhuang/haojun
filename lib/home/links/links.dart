import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:icons_plus/icons_plus.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(
          size.width * 0.2, size.height * 0.2, size.width * 0.2, 0),
      child: const Column(
        children: [
          Link(Icons.email, 'rickyzhuang2003@berkeley.edu'),
          Link(
            Bootstrap.linkedin,
            'https://www.linkedin.com/in/haojun-zhuang-614964220/',
            clickable: true,
          ),
          Link(
            Bootstrap.github,
            'https://github.com/Hogean',
            clickable: true,
          ),
        ],
      ),
    );
  }
}

class Link extends StatelessWidget {
  const Link(this.icon, this.link, {this.clickable = false, super.key});

  final IconData icon;
  final String link;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: deepBlue,
            ),
            const SizedBox(width: 10),
            clickable
                ? InkWell(
                    child: Text(link, style: bodyHyperlink),
                    onTap: () => launchUrl(Uri.parse(link)))
                : Text(link, style: body)
          ],
        ));
  }
}
