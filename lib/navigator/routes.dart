import 'package:flutter/material.dart';
import 'package:m1_s4/main.dart';
import 'package:m1_s4/pages/home.dart';
import 'package:m1_s4/widgets/animatedBuilder.dart';
import 'package:m1_s4/widgets/fittedBox.dart';
import 'package:m1_s4/widgets/navegacion.dart';
import 'package:m1_s4/pages/detalle_page.dart';
import 'package:m1_s4/pages/welcome_page.dart';
import 'package:m1_s4/widgets/alertas.dart';
import 'package:m1_s4/widgets/apectRatio.dart';
import 'package:m1_s4/widgets/backdropFilter.dart';
import 'package:m1_s4/widgets/clipOval.dart';
import 'package:m1_s4/widgets/clipPath.dart';
import 'package:m1_s4/widgets/clipRect.dart';
import 'package:m1_s4/widgets/constranedBox.dart';
import 'package:m1_s4/widgets/cupertino.dart';
import 'package:m1_s4/widgets/customPaint.dart';
import 'package:m1_s4/widgets/decoratedBox.dart';
import 'package:m1_s4/widgets/formulario.dart';
import 'package:m1_s4/widgets/formulario_simple.dart';
import 'package:m1_s4/widgets/images.dart';
import 'package:m1_s4/widgets/login.dart';
import 'package:m1_s4/widgets/navegacion_hero.dart';
import 'package:m1_s4/widgets/opacity.dart';
import 'package:m1_s4/widgets/positionedTransition.dart';
import 'package:m1_s4/widgets/rotatedBox.dart';
import 'package:m1_s4/widgets/sixedBox.dart';
import 'package:m1_s4/widgets/splash.dart';
import 'package:m1_s4/widgets/spotify.dart';
import 'package:m1_s4/widgets/targetPlatform.dart';
import 'package:m1_s4/widgets/task.dart';
import 'package:m1_s4/widgets/transform.dart';
import 'package:m1_s4/widgets/video.dart';
import 'package:m1_s4/widgets/youtube.dart';
import 'package:m1_s4/youtube/main.dart';

import '../widgets/animatedContainer.dart';

Map<String, Widget Function(BuildContext)> generateRoutes(
    BuildContext constext) {
  return {
    '/': (context) => Home(),
    '/images': (context) => const ImageScreen(),
    '/videos': (context) => const VideoApp(),
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
    '/formulario': (context) => Formulario(),
    '/alertas': (context) => Alertas(),
    '/navegacion': (context) => Navegacion(),
    '/secondRoute': (context) => SecondRoute(),
    '/thirdRoute': (context) => ThirdRoute(),
    '/navHero': (context) => NavegacionHero(),
    '/task': (context) => TaskListScreen(),
    '/animatedContainer': (context) => AnimatedContainerWidget(),
    '/animatedBuilder': (context) => AnimatedBuilderWidget(),
    '/splashScreen': (context) => SplashScreen(),
    '/positionedTransition': (context) => PositionedTransitionWidget(),
  };
}
