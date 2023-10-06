import 'package:flutter/material.dart';
import 'package:m1_s4/atomic-design/main.dart';
import 'package:m1_s4/bloc/main.dart';
import 'package:m1_s4/inheritedWidget/main.dart';
import 'package:m1_s4/main.dart';
import 'package:m1_s4/pages/acelerometer.dart';
import 'package:m1_s4/pages/audio_player.dart';
import 'package:m1_s4/pages/camera.dart';
import 'package:m1_s4/pages/flashlight.dart';
import 'package:m1_s4/pages/gps.dart';
import 'package:m1_s4/pages/home.dart';
import 'package:m1_s4/pages/http.dart';
import 'package:m1_s4/pages/image_picker.dart';
import 'package:m1_s4/pages/microphone.dart';
import 'package:m1_s4/pages/notifications.dart';
import 'package:m1_s4/pages/provider.dart';
import 'package:m1_s4/pages/random.dart';
import 'package:m1_s4/pages/rating_page.dart';
import 'package:m1_s4/pages/refactor.dart';
import 'package:m1_s4/pages/refactor2.dart';
import 'package:m1_s4/provider/main.dart';
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
    '/detailPage': (context) => const DetallePage(),
    '/welcomePage': (context) => const WelcomePage(),
    '/youtubeApp': (context) => const YoutubeApp(),
    '/cupertinoDemo': (context) => const CupertinoDemo(),
    '/targetPlatform': (context) => const TargetPlatformDemo(),
    '/formularioSimple': (context) => const FormularioSimple(),
    '/formulario': (context) => const Formulario(),
    '/alertas': (context) => const Alertas(),
    '/navegacion': (context) => const Navegacion(),
    '/secondRoute': (context) => const SecondRoute(),
    '/thirdRoute': (context) => const ThirdRoute(),
    '/navHero': (context) => const NavegacionHero(),
    '/task': (context) => TaskListScreen(),
    '/animatedContainer': (context) => const AnimatedContainerWidget(),
    '/animatedBuilder': (context) => const AnimatedBuilderWidget(),
    '/splashScreen': (context) => SplashScreen(),
    '/positionedTransition': (context) => PositionedTransitionWidget(),
    '/inheritedWidgetApp': (context) => const InheritedWidgetApp(),
    '/shoppingProviderApp': (context) => const ShoppingProviderApp(),
    '/shoppingBlocApp': (context) => const ShoppingBlocApp(),
    '/imagePicker': (context) => const ImagePickerScreen(),
    '/camera': (context) => const CameraScreen(),
    '/gps': (context) => const GpsScreen(),
    '/notifications': (context) => const NotificationsScreen(),
    '/flashlight': (context) => const FlashlightScreen(),
    '/microphone': (context) => const MicrophoneScreen(),
    '/acelerometer': (context) => AccelerometerScreen(),
    '/random': (context) => RandomScreen(),
    '/http': (context) => HttpPage(),
    '/audioPlayers': (context) => AudioPlayerPage(),
    '/provider': (context) => ProviderPage(),
    '/refactor': (context) => RefactorScreen(),
    '/refactor2': (context) => Refactor2Screen(),
    '/atomicDesign': (context) => AtomicDesignApp(),
    '/rating': (context) => RatingScreen(),
  };
}
