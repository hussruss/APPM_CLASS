import 'package:flutter/material.dart';
import 'package:m1_s4/widgets/apectRatio.dart';
import 'package:m1_s4/widgets/constranedBox.dart';
import 'package:m1_s4/widgets/images.dart';
import 'package:m1_s4/widgets/login.dart';
import 'package:m1_s4/widgets/sixedBox.dart';
import 'package:m1_s4/widgets/spotify.dart';
import 'package:m1_s4/widgets/video.dart';
import 'package:m1_s4/widgets/youtube.dart';

import 'widgets/fittedBox.dart';

//'https://source.unsplash.com/random/250×250/?programming&${index}'

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    const hola = '';
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/images': (context) => const ImageScreen(),
        '/video': (context) => const VideoApp(),
        '/youtube': (context) => const Youtube(),
        '/spotify': (context) => const Spotify(),
        '/fittedBox': (context) => const FittedBoxWidget(),
        '/aspectRatio': (context) => const AspectRatioWidget(),
        '/sizedBox': (context) => const SizedBoxWidget(),
        '/constrainedBox': (context) => const ConstrainedBoxWidget(),
        '/login': (context) => const LoginScreen(),
      },
      // theme: ThemeData.dark().copyWith(
      //     appBarTheme: AppBarTheme(color: Colors.red),
      //     floatingActionButtonTheme:
      //         FloatingActionButtonThemeData(backgroundColor: Colors.red)),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                // style: ButtonStyle(
                // backgroundColor: MaterialStatePropertyAll(Colors.green),
                // textStyle: MaterialStateProperty.all(
                //     TextStyle(color: Colors.white))),
                label: Text('Image'),
                onPressed: () {
                  Navigator.pushNamed(context, '/images');
                },
                icon: Icon(Icons.image)),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
              label: Text('video'),
              onPressed: () {
                Navigator.pushNamed(context, '/video');
              },
              icon: Icon(Icons.video_file)),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
              label: Text('Youtube'),
              onPressed: () {
                Navigator.pushNamed(context, '/youtube');
              },
              icon: Icon(Icons.video_camera_front_outlined)),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
              label: Text('Spotify'),
              onPressed: () {
                Navigator.pushNamed(context, '/spotify');
              },
              icon: Icon(Icons.queue_music)),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
              label: Text('FittedBox'),
              onPressed: () {
                Navigator.pushNamed(context, '/fittedBox');
              },
              icon: Icon(Icons.add_box)),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
              label: Text('AspectRatio'),
              onPressed: () {
                Navigator.pushNamed(context, '/aspectRatio');
              },
              icon: Icon(Icons.check_box)),
          TextButton.icon(
              label: Text('SizedBox'),
              onPressed: () {
                Navigator.pushNamed(context, '/sizedBox');
              },
              icon: Icon(Icons.space_bar)),
          TextButton.icon(
              label: Text('ConstrainedBox'),
              onPressed: () {
                Navigator.pushNamed(context, '/constrainedBox');
              },
              icon: Icon(Icons.maximize)),
          TextButton.icon(
              label: Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              icon: Icon(Icons.login))
        ],
      ),
    );
  }
}
