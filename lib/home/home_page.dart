import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/home/home_page_provider.dart';
import 'package:me/home/links/links.dart';
import 'package:me/home/myself/myself.dart';
import 'package:me/showcase/showcase_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageProvider provider = Provider.of<HomePageProvider>(context);

    return Scaffold(
      body: Row(
        children: [
          const NavigationDrawer(),
          Expanded(
            child: IndexedStack(
              index: provider.pageIndex,
              children: const [
                MyselfPage(),
                ShowcasePage(),
                LinksPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({super.key});

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double drawerCollapseWidth = size.width * 0.05;
    double drawerExpandWidth = size.width * 0.15;

    HomePageProvider provider = Provider.of<HomePageProvider>(context);

    return MouseRegion(
      onHover: (_) {
        provider.expandDrawer();
      },
      onExit: (_) {
        provider.collapseDrawer();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        width: provider.isExpanded ? drawerExpandWidth : drawerCollapseWidth,
        color: deepBlue,
        onEnd: () {
          provider.doShowText();
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationLink(
                  text: 'Home',
                  icon: Icons.person_4_outlined,
                  showText: provider.showText,
                  drawerCollapseWidth: drawerCollapseWidth,
                  index: 0),
              NavigationLink(
                  text: 'Projects',
                  icon: Icons.code_outlined,
                  showText: provider.showText,
                  drawerCollapseWidth: drawerCollapseWidth,
                  index: 1),
              NavigationLink(
                text: 'Links',
                icon: Icons.link_outlined,
                showText: provider.showText,
                drawerCollapseWidth: drawerCollapseWidth,
                index: 2,
              ),
            ]),
      ),
    );
  }
}

class NavigationLink extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool showText;
  final int index;
  final double drawerCollapseWidth;

  const NavigationLink(
      {required this.text,
      required this.icon,
      required this.showText,
      required this.index,
      required this.drawerCollapseWidth,
      super.key});

  @override
  Widget build(BuildContext context) {
    HomePageProvider provider = Provider.of<HomePageProvider>(context);

    double iconSize = drawerCollapseWidth * 0.45;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: deepBlue,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          provider.setPageIndex(index);
        },
        child: Container(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: (drawerCollapseWidth - iconSize) / 4),
                Icon(icon, color: Colors.white, size: iconSize),
                showText ? const SizedBox(width: 20) : const SizedBox.shrink(),
                showText
                    ? Text(text, style: title4White)
                    : const SizedBox.shrink(),
              ],
            )),
      ),
    );
  }
}
