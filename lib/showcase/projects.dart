import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/widgets/tile_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  _cardBuilder(
      {required String title,
      required String image,
      required String text,
      Function? onTap}) {
    onTap ??= () {};

    return Container(
      margin: const EdgeInsets.all(20),
      height: 400,
      width: 500,
      child: Column(
        children: [
          TiltCard(
            borderColor: Colors.black,
            title: title,
            image: image,
            onTap: onTap,
          ),
          SizedBox(height: 10),
          Text(text, style: body, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
            child: Wrap(
              // spacing: size.width * 0.01,
              children: [
                _cardBuilder(
                    title: 'Network ABM Simulation',
                    image: 'projects/lines.png',
                    text:
                        'An agent-based network simulation written in python to simulate the spread of an HAI.'),
                _cardBuilder(
                    title: 'Adverserial Machine Learning',
                    image: 'projects/robust_network.png',
                    text:
                        'We trained a robust image classifier nerual network that defenses against adverserial perturbations to the image. Lagrangians are awesome.'),
                _cardBuilder(
                    title: 'Globesisters Mobile App',
                    image: 'projects/globesisters.png',
                    text:
                        'A mobile app that provides both a hosting platform and safe travel experiences for women. Written in flutter.'),
                _cardBuilder(
                    title: 'End-to-end Encrypted File Sharing System',
                    image: 'projects/161.jpg',
                    text:
                        'A secure file sharing system written in golang. Algorithms such as symmetric encryption, RSA, EMACS, and Argon2 were used.'),
                _cardBuilder(
                    title: 'Gitlet',
                    image: 'projects/gitlet.png',
                    text:
                        'An imitation of the git version control system written in Java.'),
                _cardBuilder(
                    title: 'My PC!',
                    image: 'projects/placeholder.png',
                    text: 'AMD Ryzen 5 5600X, EVGA RTX 3060Ti'),
              ],
            )));
  }
}
