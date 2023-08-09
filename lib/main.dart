import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:m1_s4/navigator/navigatorObserver.dart';
import 'package:m1_s4/services/local_notifications_service.dart';
import 'navigator/routes.dart';

//'https://source.unsplash.com/random/250×250/?programming&${index}'
late List<CameraDescription> cameras;
final localNotificationService = LocalNotificationsService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  //await localNotificationService.setup();

  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        initialRoute: '/',
        routes: generateRoutes(context)

        // theme: ThemeData.dark().copyWith(
        //     appBarTheme: AppBarTheme(color: Colors.red),
        //     floatingActionButtonTheme:
        //         FloatingActionButtonThemeData(backgroundColor: Colors.red)),
        );
  }
}
