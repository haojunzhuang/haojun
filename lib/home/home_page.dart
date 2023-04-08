import 'package:flutter/material.dart';
import 'package:me/globals.dart';
import 'package:me/home/home_page_provider.dart';
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
          NavigationDrawer(),
          Expanded(
            child: IndexedStack(
              index: provider.pageIndex,
              children: [
                Container(
                  color: Colors.red,
                ),
                ShowcasePage(),
                Container(
                  color: Colors.purple,
                ),
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
    double darwerCollapseWidth = size.width * 0.07;
    double darwerExpandWidth = size.width * 0.2;

    HomePageProvider provider = Provider.of<HomePageProvider>(context);

    return MouseRegion(
      onHover: (_) {
        provider.expandDrawer();
      },
      onExit: (_) {
        provider.collapseDrawer();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: provider.isExpanded ? darwerExpandWidth : darwerCollapseWidth,
        color: deepBlue,
        onEnd: () {
          if (provider.isExpanded == true) {
            provider.manageShowText();
          }
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationLink(
                  text: 'Home',
                  icon: Icons.home,
                  showText: provider.showText,
                  index: 0),
              NavigationLink(
                  text: 'About',
                  icon: Icons.info,
                  showText: provider.showText,
                  index: 1),
              NavigationLink(
                text: 'Contact',
                icon: Icons.contact_mail,
                showText: provider.showText,
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
  bool showText;
  final int index;

  NavigationLink(
      {required this.text,
      required this.icon,
      required this.showText,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    HomePageProvider provider = Provider.of<HomePageProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: deepBlue,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          provider.setPageIndex(index);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5),
            Icon(icon, color: Colors.white),
            showText ? const SizedBox(width: 20) : const SizedBox.shrink(),
            showText
                ? Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
