import 'package:flutter/material.dart';
import 'package:m1_s4/youtube/screens/home.dart';

class YoutubeApp extends StatelessWidget {
  const YoutubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => Home(),
      },
      // theme: ThemeData.dark().copyWith(
      //     appBarTheme: AppBarTheme(color: Colors.red),
      //     floatingActionButtonTheme:
      //         FloatingActionButtonThemeData(backgroundColor: Colors.red)),
    );
  }
}
