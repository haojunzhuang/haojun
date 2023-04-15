import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/showcase/blog/image.dart';
import 'package:me/showcase/blog/text_widgets.dart';

class BlogSmile extends StatelessWidget {
  const BlogSmile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.2, vertical: 50),
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageWithCredit(
                          name: 'smiles.png',
                          width: size.width * 0.4,
                          credit:
                              'https://www.boredpanda.com/cute-smiling-animals/?utm_source=google&utm_medium=organic&utm_campaign=organic'),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Animals Who Smile', style: title1),
                      ),
                      const BodyText(
                          'Humans are not the only species that can form a grin. Animals like chimpanzees, dogs, and dolphins sometimes smile as well, but their meanings are often different from our smiles.'),
                      BodyTextWithSingleHyperlink(
                          'Chimpanzees also smile but in a very different way. Debbie who works at a chimpanzee sanctuary shared a surprising fact she learned when she first started working: Do not smile at chimpanzees because it is viewed as threatening behavior by them. Instead,',
                          ' do a “chimpanzee” smile ',
                          'by showing only your bottom teeth. Just like humans, chimpanzees rely on a lot of nonverbal cues to communicate with each other. A chimpanzee showing its top teeth is trying to intimate others while showing its bottom teeth expresses submission. The convention of chimpanzees’ smiles is very different from humans.',
                          'https://chimpsnw.org/2013/09/chimpanzee-smiles/'),
                      ImageWithCredit(
                          title: 'A Submissive Smile',
                          name: 'chimpanzee.jpg',
                          credit:
                              'https://chimpsnw.org/2013/09/chimpanzee-smiles/',
                          width: size.width * 0.5),
                      BodyTextWithSingleHyperlink(
                          'Dogs are human’s best friends, and some people can find their dogs smiling adorably. However,dogs do not actually understand what is a smile. We perceive some of their facial expressions as smiling because ',
                          'some particular facial muscles',
                          ' of theirs are able to move in similar ways as ours. Then why will dogs choose to move their facial muscles so that it looks like a smile? Dogs are masters at understanding human emotions. What dogs do know is that their smiling pleases us, so the intention behind their smiling is to make us feel happy.',
                          'https://www.eurekalert.org/news-releases/947494'),
                      BodyTextWithSingleHyperlink(
                          'Some marine animals can also perform a smile-like expression, like dolphins. However, dolphin smiles are widely misunderstood. Common bottlenose dolphins, for instance, appear to be smiling at people because their mouths are naturally curved. This resemblance to a human smile can lead people to feel that dolphins are always happy when meeting humans, which is not true. In the famous documentary, ',
                          'The Cove',
                          ', photographers secretly recorded how the Japanese dolphin hunting business operates. Hundreds of dolphins were killed at the cove, and the seawater was dyed red by the dolphin blood. Shockingly, some of the dead dolphins were still "smiling", despite the tragedy that had fallen on them and their families.',
                          'https://www.opsociety.org/our-work/films/the-cove/'),
                      ImageWithCredit(
                          title: 'Dolphins Are Not Actually Smiling',
                          name: 'dolphins.jpg',
                          credit:
                              'https://www.rd.com/article/sorry-dolphins-arent-smiling/'),
                      BodyTextWithSingleHyperlink(
                          '',
                          'According to Wikipedia,',
                          'there are at least 50 aquariums around the world that keep dolphins at capacity and offer tourists entertainment shows of dolphins. When I was young, I enjoyed a few dolphin shows too. I cheered for the magnificent performance of the trainers and dolphins and how coordinated they are. Watching the dolphins catching the little fish thrown by the trainer with a grin on their face, I was convinced that the dolphin must enjoy the show and the reward.',
                          'https://en.wikipedia.org/wiki/List_of_dolphinariums'),
                      BodyTextWithSingleHyperlink(
                          'However, it is very unlikely that dolphins in the marine parks were actually happy. ',
                          'According to a report by Lauren Kearny',
                          ', wild dolphins often swim 40 to 100 miles a day, while an average dolphin tank in an aquarium is only 24 feet wide. The small room makes the dolphins frustrated and anxious. Moreover, dolphins are highly social beings, which means that they depend on their family members a lot. Being kept alone is devastating to their mental health. Nevertheless, they still look as happy as always to every tourist because their mouths are always curved like a smile.',
                          'https://www.onegreenplanet.org/animalsandnature/how-captivity-capitalizes-on-dolphin-smiles/'),
                      BodyText(
                          'Animals other than human can also perform facial expressions that resembles a human smile. However, we must not simply view them as a sign of happiness. Just like human smiles can be genuine or fake, animal smiles are complicated and can sometimes be deceiving.')
                    ]))));
  }
}
