import 'package:flutter/material.dart';
import 'package:m1_s4/main.dart';

class Const {
  static List<ButtonIconItem> itemList = [
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
    ButtonIconItem(
        'Formulario con validaciones', Icons.text_format, '/formulario'),
    ButtonIconItem('Alertas', Icons.warning, '/alertas'),
    ButtonIconItem('Navegacion', Icons.navigation, '/navegacion'),
    ButtonIconItem('Navegacion', Icons.star_purple500_rounded, '/navHero'),
    ButtonIconItem('Task', Icons.task, '/task'),
  ];
}
