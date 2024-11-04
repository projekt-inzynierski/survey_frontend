import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static Future initialize() async {
    tz.initializeTimeZones();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSInize = DarwinInitializationSettings();
    const initializationSettings =
        InitializationSettings(android: androidInit, iOS: iOSInize);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await Permission.notification.request();
    await Permission.scheduleExactAlarm.request();
  }

  static Future scheduleNotification(DateTime scheduledDate,
      {String? title, String? body}) async {
    const androidDetails = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iOSDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    if (scheduledDate.isBefore(DateTime.now())) {
      //TODO LOG IT
      return;
    }
    title ??= 'Notification';
    body ??= 'Body';

    for (var i = 0; i < 100; i++) {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        i,
        '$title $i',
        body,
        tz.TZDateTime.from(scheduledDate, tz.local).add(Duration(seconds: i)),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  static Future cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
