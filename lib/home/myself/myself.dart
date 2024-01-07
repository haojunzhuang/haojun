import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/widgets/inline_hyperlink_text.dart';

class MyselfPage extends StatelessWidget {
  const MyselfPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(
          size.width * 0.2, size.height * 0.2, size.width * 0.2, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const CircleAvatar(
          //   radius: 50,
          //   backgroundImage: AssetImage('assets/images/myself.jpeg'),
          // ),
          Center(child: Container(
            width: size.width * 0.12,
            height: size.width * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              image: const DecorationImage(
                image: AssetImage('assets/images/myself2.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),),
          
          SizedBox(height: size.height * 0.02),
          Center(child: Text('Haojun Zhuang', style: title2),),
          
          SizedBox(height: size.height * 0.03),
          InlineHyperlinkText(
            const [
              'Hi there! I am a junior majoring in Computer Science at',
              ' UC Berkeley.',
            ],
            const ['https://www.berkeley.edu/'],
          ),
          SizedBox(height: size.height*.02,),
          InlineHyperlinkText(const [
            'I am interested in software engineering, machine learning, statistics, and computational neuroscience. I do research at ',
            'D\'Esposito Lab',
            ' and ',
            'MINDSCAPE@UCSF. ',
            'Previously, I worked as software engineering interns at ',
            'Globesisters',
            ' and ',
            'Applied Motion Products.',
          ], const [
            'https://sites.google.com/berkeley.edu/desposito-lab',
            'https://mindscape.team/',
            'https://www.globesisters.com/',
            'https://www.applied-motion.com/s/'
          ]),
           SizedBox(height: size.height*.02,),
          InlineHyperlinkText(const [
            'When I\'m not coding or enhancing my mathematical maturity, you\'ll likely find me spending time with my girlfriend and my cat Yuzu, hanging out with friends, playing basketball, or enjoying video games. I\'m also keen on cooking, asking ChatGPT to create fantasy novels for me, and taking leisurely drives around Emeryville.'
          ], const []),
           SizedBox(height: size.height*.02,),
          InlineHyperlinkText(const [
            'Current Game(s) I\'m grinding: Bauldur\'s Gate 3, Mini Metros, NBA2K.'
          ], const []),
        ],
      ),
    );
  }
}
