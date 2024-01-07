import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/widgets/entry.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(height * 0.1),
            child: 
            SingleChildScrollView(child:
            
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Expanded(child: ProjectsDescription(),),
              Container(
                width: 300,
                child:Column(
                children: [
                  Text('Images and videos will be posted here', style: body)
                ],
              ) )
              
            ]))));
  }
}

class ProjectsDescription extends StatelessWidget {
  const ProjectsDescription({super.key});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return 
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: Text('Click on the title of each project to learn more.',
            style: title3),
      ),
      Entry(
        title: 'Network ABM Simulation',
        text: 'A simulation for tracking and analyzing HAI transmissions @ UCSF',
        onPressed: () => _launchURL(
            'https://github.com/haojunzhuang/ms_simulation'),
      ),
      Entry(
        title: 'NeRF',
        text: 'A simple recreation of NeRF',
        onPressed: () => _launchURL(
            'https://inst.eecs.berkeley.edu/~cs180/fa23/upload/files/proj5/rickyzhuang2003/'),
      ),
      Entry(
        title: 'CS180 Final Project',
        text: 'AR & Neural Style Transfer',
        onPressed: () => _launchURL(
            'https://inst.eecs.berkeley.edu/~cs180/fa23/upload/files/proj6/rickyzhuang2003/'),
      ),
      Entry(
        title: 'Adverserial Machine Learning',
        text:
            'Provably robust image recognition nerual network powered by lagrangian and duality',
        onPressed: () => {},
      ),
      Entry(
        title: 'Modile',
        text:
            'A mobile app that allows control of AMP\' electric motors, powered by Modbus protocol',
        onPressed: () => _launchURL('https://github.com/haojunzhuang/Modile'),
      ),
      // Container(height: height * .02),
      Entry(
        title: 'R4B Writer\'s Blog',
        text: 'R4B essay 3',
        onPressed: () => Navigator.of(context).pushNamed('/blog'),
      ),
      Entry(
        title: 'R4B Final Project: Love Simulation',
        text: 'Supplement to R4B essay 4',
        onPressed: () => Navigator.of(context).pushNamed('/simulations/love'),
      ),
      Entry(
        title: 'Gitlet',
        text: 'A miniature git written in java',
        onPressed: () => Navigator.of(context).pushNamed('/'),
      ),
      Entry(
        title: 'REGULUS',
        text: 'An end-to-end encrypted file sharing system',
        onPressed: () => Navigator.of(context).pushNamed('/'),
      ),
      Entry(
        title: 'CS61CPU',
        text: 'a CPU that runs actual RISC-V instructions',
        onPressed: () => Navigator.of(context).pushNamed('/'),
      ),
      // Container(height: height * .02),
      Entry(
        title: 'Flatland',
        text: 'A tale of Flatfish Xu Tao',
        onPressed: () => Navigator.of(context).pushNamed('/flatland'),
      ),
      Entry(
        title: 'Lapidary',
        text: 'Yu Long\'s Minecraft Mod',
        onPressed: () => Navigator.of(context).pushNamed('/'),
      ),
      Entry(
        title: 'My PC',
        text:
            'Powered by RTX. A deep learning working station rather than a gaming PC (really).',
        onPressed: () => Navigator.of(context).pushNamed('/'),
      ),
      Entry(
        title: 'This website',
        text: '',
        onPressed: () => Navigator.of(context).pushNamed('/'),
      ),
      Entry(
        title: 'IB IAs',
        text: 'Personal Research Projects',
        onPressed: () => Navigator.of(context).pushNamed('/'),
      ),
    ]);
  }
}

// import 'package:flutter/material.dart';
// import 'package:me/globals.dart';
// import 'package:me/widgets/tile_card.dart';

// class ProjectsPage extends StatelessWidget {
//   const ProjectsPage({super.key});

//   _cardBuilder(
//       {required String title,
//       required String image,
//       required String text,
//       Function? onTap}) {
//     onTap ??= () {};

//     return Container(
//       margin: const EdgeInsets.all(20),
//       height: 400,
//       width: 500,
//       child: Column(
//         children: [
//           TiltCard(
//             borderColor: Colors.black,
//             title: title,
//             image: image,
//             onTap: onTap,
//           ),
//           SizedBox(height: 10),
//           Text(text, style: body, textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return SingleChildScrollView(
//         child: Padding(
//             padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
//             child: Wrap(
//               // spacing: size.width * 0.01,
//               children: [
//                 _cardBuilder(
//                     title: 'Network ABM Simulation',
//                     image: 'projects/lines.png',
//                     text:
//                         'An agent-based network simulation written in python to simulate the spread of an HAI.'),
//                 _cardBuilder(
//                     title: 'Adverserial Machine Learning',
//                     image: 'projects/robust_network.png',
//                     text:
//                         'We trained a robust image classifier nerual network that defenses against adverserial perturbations to the image. Lagrangians are awesome.'),
//                 _cardBuilder(
//                     title: 'Globesisters Mobile App',
//                     image: 'projects/globesisters.png',
//                     text:
//                         'A mobile app that provides both a hosting platform and safe travel experiences for women. Written in flutter.'),
//                 _cardBuilder(
//                     title: 'End-to-end Encrypted File Sharing System',
//                     image: 'projects/161.jpg',
//                     text:
//                         'A secure file sharing system written in golang. Algorithms such as symmetric encryption, RSA, EMACS, and Argon2 were used.'),
//                 _cardBuilder(
//                     title: 'Gitlet',
//                     image: 'projects/gitlet.png',
//                     text:
//                         'An imitation of the git version control system written in Java.'),
//                 _cardBuilder(
//                     title: 'My PC!',
//                     image: 'projects/placeholder.png',
//                     text: 'AMD Ryzen 5 5600X, EVGA RTX 3060Ti'),
//               ],
//             )));
//   }
// }
