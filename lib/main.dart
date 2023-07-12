import 'package:flutter/material.dart';
import 'package:m1_s4/pages/detalle_page.dart';
import 'package:m1_s4/pages/welcome_page.dart';
import 'package:m1_s4/widgets/apectRatio.dart';
import 'package:m1_s4/widgets/backdropFilter.dart';
import 'package:m1_s4/widgets/clipOval.dart';
import 'package:m1_s4/widgets/clipPath.dart';
import 'package:m1_s4/widgets/clipRect.dart';
import 'package:m1_s4/widgets/constranedBox.dart';
import 'package:m1_s4/widgets/cupertino.dart';
import 'package:m1_s4/widgets/customPaint.dart';
import 'package:m1_s4/widgets/decoratedBox.dart';
import 'package:m1_s4/widgets/formulario_simple.dart';
import 'package:m1_s4/widgets/images.dart';
import 'package:m1_s4/widgets/login.dart';
import 'package:m1_s4/widgets/opacity.dart';
import 'package:m1_s4/widgets/rotatedBox.dart';
import 'package:m1_s4/widgets/sixedBox.dart';
import 'package:m1_s4/widgets/spotify.dart';
import 'package:m1_s4/widgets/transform.dart';
import 'package:m1_s4/widgets/video.dart';
import 'package:m1_s4/widgets/youtube.dart';
import 'package:m1_s4/youtube/main.dart';

import 'widgets/fittedBox.dart';
import 'widgets/targetPlatform.dart';

//'https://source.unsplash.com/random/250×250/?programming&${index}'

void main() => runApp(const MyApps());

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
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
        '/backDropFilter': (context) => const BackDropFilterWidget(),
        '/clipOval': (context) => const ClipOvalWidget(),
        '/clipPath': (context) => const ClipPathWidget(),
        '/clipRect': (context) => const ClipRectWidget(),
        '/customPaint': (context) => const CustomPaintWidget(),
        '/decoratedBox': (context) => const DecoratedBoxWidget(),
        '/opacity': (context) => const OpacityWidget(),
        '/rotatedBox': (context) => const RotatedWidget(),
        '/transform': (context) => const TransformWidget(),
        '/detailPage': (context) => DetallePage(),
        '/welcomePage': (context) => WelcomePage(),
        '/youtubeApp': (context) => YoutubeApp(),
        '/cupertinoDemo': (context) => CupertinoDemo(),
        '/targetPlatform': (context) => TargetPlatformDemo(),
        '/formularioSimple': (context) => FormularioSimple(),
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
        title: const Text('HOME'),
      ),
      body: GridView.builder(
        itemCount: itemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4),
        itemBuilder: (BuildContext context, int index) {
          return _buildItemButon(index, context);
        },
      ),
    );
  }

  GestureDetector _buildItemButon(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, itemList[index].route);
      },
      child: Card(
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.primaries[index % Colors.primaries.length],
                Colors.primaries[index % Colors.primaries.length].shade500,
                Colors.primaries[index + 1 % Colors.primaries.length],
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(children: [
            Expanded(
                child: Icon(
              itemList[index].icon,
              color: Colors.white,
              size: 50,
            )),
            Text(
              itemList[index].title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}

List<ButtonIconItem> itemList = [
  ButtonIconItem('Image', Icons.image, '/images'),
  ButtonIconItem('Video', Icons.video_file, '/video'),
  ButtonIconItem('Youtube', Icons.video_camera_front_outlined, '/youtube'),
  ButtonIconItem('Spotify', Icons.queue_music, '/spotify'),
  ButtonIconItem('FittedBox', Icons.add_box, '/fittedBox'),
  ButtonIconItem('AspectRatio', Icons.check_box, '/aspectRatio'),
  ButtonIconItem('SizedBox', Icons.space_bar, '/sizedBox'),
  ButtonIconItem('ConstrainedBox', Icons.maximize, '/constrainedBox'),
  ButtonIconItem('Login', Icons.login, '/login'),
  ButtonIconItem('BackDropFilter', Icons.blur_circular, '/backDropFilter'),
  ButtonIconItem('ClipÓval', Icons.circle, '/clipOval'),
  ButtonIconItem('ClipPath', Icons.format_shapes, '/clipPath'),
  ButtonIconItem('ClipRect', Icons.rectangle, '/clipRect'),
  ButtonIconItem('CustomPaint', Icons.format_paint, '/customPaint'),
  ButtonIconItem(
      'DecoratedBox', Icons.check_box_outline_blank, '/decoratedBox'),
  ButtonIconItem('Opacity', Icons.opacity, '/opacity'),
  ButtonIconItem('RotatedBox', Icons.rotate_90_degrees_ccw, '/rotatedBox'),
  ButtonIconItem('Transform', Icons.transform, '/transform'),
  ButtonIconItem('Youtube App', Icons.youtube_searched_for, '/youtubeApp'),
  ButtonIconItem('Welcome Page', Icons.rocket, '/welcomePage'),
  ButtonIconItem('Detail Page', Icons.details, '/detailPage'),
  ButtonIconItem('Cupertino', Icons.apple, '/cupertinoDemo'),
  ButtonIconItem('Target Platform', Icons.web, '/targetPlatform'),
  ButtonIconItem('Formulario Simple', Icons.text_format, '/formularioSimple'),
];

class ButtonIconItem {
  final String title;
  final IconData icon;
  final String route;

  ButtonIconItem(this.title, this.icon, this.route);
}
