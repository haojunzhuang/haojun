import 'package:flutter/material.dart';
import 'package:me/home/home_page.dart';
import 'package:me/home/home_page_provider.dart';
import 'package:me/profile_page.dart';
import 'package:me/showcase/blog/blog_home.dart';
import 'package:me/showcase/blog/blog_monogamy.dart';
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
      routes: {
        '/blog': (context) => const BlogHome(),
        '/blog/monogamy': (context) => const BlogMonogamy(),
      },
    );
  }
}
