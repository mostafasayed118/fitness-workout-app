import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();

  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //basic Notification
  static Future showBasicNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
      // to control the notification
      'main_channel',
      'Main channel',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('sound.wav'.split('.').first),
    );
    NotificationDetails details = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      details,
      payload: payload,
    );
  }

  static Future showRepeatedNotification({
    int id = 1,
    String? title,
    String? body,
    String? payload,
  }) async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
      // to control the notification
      'main_channel',
      'Main channel',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('sound.wav'.split('.').first),
    );
    NotificationDetails details = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.daily,
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: payload,
    );
  }

  static Future cancelAllNotification(int id, String? payload) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static void dispose() {
    streamController.close();
  }
}

// act as
