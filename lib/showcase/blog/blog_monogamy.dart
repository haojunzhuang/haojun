import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/showcase/blog/image.dart';
import 'package:me/showcase/blog/text_widgets.dart';

class BlogMonogamy extends StatelessWidget {
  const BlogMonogamy({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.2, vertical: 50),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageWithCredit(
                name: 'animals.jpg',
                width: size.width * 0.6,
                credit:
                    'https://www.youtube.com/watch?v=bxQdLhOQf5c&embeds_euri=https%3A%2F%2Fwww.psychmechanics.com%2F&source_ve_path=MzY5MjUsMjM4NTE&feature=emb_title'),
            const Padding(
              padding: EdgeInsets.all(20),
              child:
                  Text('Married to your loved one … or ones?', style: title1),
            ),
            const BodyText(
              'While early humans were naturally polygynous, modern human societies have largely adapted to monogamous marriage system due to its significant advantages in the world we are currently living in.',
            ),
            const BodyTextWithSingleHyperlink(
                'Monogamy refers to a form of marriage in which a person is committed to only one partner at a time. This form of marriage is the most widespread in human societies today. However, other forms of marriage are prevalent in various animal species. Polyandry, where one male is married to multiple females, can be found ',
                'in bee societies',
                '. On the other hand, polygyny, where one male is married to multiple females, is common in mammal species.',
                'https://theapiarist.org/polyandry-colony-fitness/#:~:text=Honey%20bees%20are%20polyandrous.,daughters%20are%20of%20mixed%20paternity'),
            Row(
              children: [
                const Expanded(
                    child: BodyTextWithSingleHyperlink(
                        'In fact, about 96% of the mammal species are polygynous, and ancient human was not an exception. There are archeological evidences suggesting that early human society is a polygynous one. For example, ',
                        'researchers at University of Liverpool ',
                        'reported that early humans including Qafzeh 9 and Neanderthals have low Second-to-forth digit ratios when compared to modern humans. This ratio is a measurement of the relative length between index finger and right finger, which is also a biomarker that covaries with intra-sexual competition. A low digit ratio indicates that a certain species is more likely to be polygynous, as was the case with ancient humans.',
                        'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3081742/')),
                ImageWithCredit(
                    name: 'fingers.jpg',
                    width: size.width * 0.15,
                    credit: 'https://www.pnas.org/doi/10.1073/pnas.1108312108'),
              ],
            ),
            const BodyTextWithSingleHyperlink(
                'Apart from archaeological evidence, the practice of polygyny can also be observed in some existing tribes around the world. For instance, the Maasai tribe, which is found in Kenya and Tanzania, traditionally practices polygyny. Women in a polygynous marriage ',
                'refer to other as “co-wifes”',
                'and work together to raise each other’s children. This lifestyle is considered normal in their culture. Such tribes provide evidence that polygynous marriages are promoted in primitive human societies.',
                'https://blog.siasat.pk/maasai-marriage-story/'),
            const BodyTextWithSingleHyperlink(
              'Humans were naturally polygynous. However, in the world we live in now, ',
              'polygyny is illegal in 142 out of nearly 200 sovereign states.',
              ' We have largely adapted to monogamy. Our society has undergone dramatic changes, and monogamy may be the optimal form of marriage for humans to thrive.',
              'https://en.wikipedia.org/wiki/Legality_of_polygamy',
            ),
            Row(
              children: [
                const Expanded(
                  child: BodyText(
                      'With the emergence of kingdoms and nations, legislation on monogamous marriage became prevalent. Marriage laws became a great way for rulers to maintain order between people and to control the number of newborns. Additionally, it is important to note that the distribution of resources has changed significantly. Modern human societies tend to have a more equal distribution of resources due to industrial revolution and economic development. In the past, a woman might have been better off choosing a polygynous marriage with a wealthy man over a monogamous marriage with an average man due to the significant difference in the resources they could provide. However, in a more equally distributed society, different classes and sexes have more equal access to basic goods like food and health care. As a result, even an average-wealthy couple can enjoy a fair life through wages, making it unnecessary to join a polygynous marriage for resources.'),
                ),
                ImageWithCredit(
                    name: 'poverty.png',
                    width: size.width * 0.3,
                    credit:
                        'https://www.vox.com/the-big-idea/2016/12/23/14062168/history-global-conditions-charts-life-span-poverty')
              ],
            ),
            const BodyTextWithSingleHyperlink(
                'We modern humans benefit from monogamy a lot. Firstly, if promotes emotional health and stability for individuals by fostering trust between partners. In contrast, infidelity and multiple partners can lead to fight and divisions. According to American Psychological Association, ',
                '20% to 40% of the divorces are caused by infidelity. ',
                'Monogamous marriages are also optimal for the development of offspring. As opposed to male in a polyandrous marriage, monogamous male will be willing to offer more resources on children since they are sure that the child is his genetic offspring. It is ensured that both partners can devote themselves to maintaining a single family. When I was growing up, both my father and mother contributed significantly to my personal growth in different ways. My father is adventurous so he often took me out to different countries to broaden my worldview. On the other hand, my mother was meticulous and good at making plans. She helped a lot in my skill developments and college applications. Thanks for their mutual commitment to our family, I received the full support and guidance throughout my upbringing. Overall, the form of monogamous marriage has many advantages that contribute to healthier and more fulfilling relationships, both for individuals and for families.',
                'https://www.apa.org/pubs/journals/features/cfp-0000012.pdf'),
            const BodyText(
              'Although humans were once naturally polygynous, urban development and industrialization have enabled monogamous couples to enjoy a good quality of life as well. Good monogamous marriages benefit people by establishing tight family bonds and thus provide supportive environments for children to grow up. ',
            )
          ],
        ),
      ),
    ));
  }
}
