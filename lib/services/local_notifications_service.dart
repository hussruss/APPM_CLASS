import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  final _flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  Future<void> setUp() async {
    const androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinInitializationSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);

    await _flutterLocalNotificationPlugin.initialize(initSettings);
  }

  void showLocalNotification(String title, String body) {
    const androidNotificationDetails =
        AndroidNotificationDetails('0', 'general');
    const darwinNotificationDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    _flutterLocalNotificationPlugin.show(0, title, body, notificationDetails);
  }
}
