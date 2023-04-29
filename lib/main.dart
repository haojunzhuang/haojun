import 'package:flutter/material.dart';
import 'package:me/home/home_page.dart';
import 'package:me/home/home_page_provider.dart';
import 'package:me/mom.dart';
import 'package:me/showcase/blog/blog_home.dart';
import 'package:me/showcase/blog/blog_monogamy.dart';
import 'package:me/showcase/blog/blog_smile.dart';
import 'package:me/showcase/robot/simulation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// Define your routes

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haojun\'s space',
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: primary,
      ),
      routes: {
        '/mom': (context) => const Mom(),
        '/blog': (context) => const BlogHome(),
        '/blog/monogamy': (context) => const BlogMonogamy(),
        '/blog/smile': (context) => const BlogSmile(),
        '/simulations/love': (context) => const LoveSimulation(),
      },
    );
  }
}

MaterialColor primary = const MaterialColor(
  0x00000000,
  <int, Color>{
    50: Color.fromARGB(255, 0, 0, 0),
    100: Color.fromARGB(255, 0, 0, 0),
    200: Color.fromARGB(255, 0, 0, 0),
    300: Color.fromARGB(255, 0, 0, 0),
    400: Color.fromARGB(255, 0, 0, 0),
    500: Color.fromARGB(255, 0, 0, 0),
    600: Color.fromARGB(255, 0, 0, 0),
    700: Color.fromARGB(255, 0, 0, 0),
    800: Color.fromARGB(255, 0, 0, 0),
    900: Color.fromARGB(255, 0, 0, 0),
  },
);
