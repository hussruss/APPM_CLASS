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
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();

    return MaterialApp(
        title: 'Material App',
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          print('<<<<<onGenerateRoute $settings');
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) =>
                Scaffold(body: Center(child: Text('Not Found'))),
          );
        },
        navigatorObservers: [NavigatorHistory()],
        routes: generateRoutes(context)
        // theme: ThemeData.dark().copyWith(
        //     appBarTheme: AppBarTheme(color: Colors.red),
        //     floatingActionButtonTheme:
        //         FloatingActionButtonThemeData(backgroundColor: Colors.red)),
        );
  }
}
